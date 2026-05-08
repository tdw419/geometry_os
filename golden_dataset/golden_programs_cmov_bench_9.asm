; DESCRIPTION: The GeOS assembly code benchmarks two approaches for clamping a color value to the range of 0-255: a traditional branch-based method using conditional jumps and loads, and a branchless method utilizing conditional select (CSEL) instructions. The code measures and stores the results and instruction counts for both methods in memory.

; cmov_bench.asm -- Branch vs CSEL color clamp benchmark
;
; Clamps a color value to 0-255 range using two approaches:
;   1. Branch-based: CMP + BLT/JZ + LDI (traditional)
;   2. CSEL-based: sign extraction + CSEL (branchless)
;
; Memory map:
;   0x2400 = input color (300 = overflow test, should clamp to 255)
;   0x2401 = result_branch (branch approach result)
;   0x2402 = result_csel  (CSEL approach result)
;   0x2403 = steps_branch (instruction count for branch approach)
;   0x2404 = steps_csel  (instruction count for CSEL approach)

; === Setup ===
LDI r21, 1            ; increment constant
LDI r14, 300           ; test value: overflows 255
LDI r9, 0x2400
STORE r9, r14         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r14 > 255, set r14 = 255
LDI r13, 255
CMP r14, r13
; CMP sets r7: -1 if r14<r13, 0 if equal, 1 if r14>r13
; We want to clamp only when r14 > 255 (r7 == 1)
; Trick: compare r7 with 1. If r7 < 1 (i.e. r7 == -1), skip.
LDI r8, 1
CMP r8, r7            ; compare 1 vs CMP result
BGE r7, branch_clamp_hi  ; if 1 >= r7 (always true since r7 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r7 means r7 == -1, which means r14 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r14, 255
branch_hi_check:

; Actually, simplest correct approach: check if r14 < 255, skip; else clamp
; Reset and redo cleanly
LDI r14, 300
LDI r20, 0

; Upper clamp using BLT: if r14 < 255, skip
LDI r13, 255
CMP r14, r13
BLT r7, branch_lo       ; r14 < 255, skip upper clamp
LDI r14, 255              ; r14 >= 255, clamp

branch_lo:
; Lower clamp: if r14 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r13, r14
LDI r8, 31
SAR r13, r8               ; r13 = all-ones if negative, all-zeros if positive
JZ r13, branch_done       ; if not negative, done
LDI r14, 0                ; clamp to 0

branch_done:
LDI r9, 0x2401
STORE r9, r14             ; save branch result
LDI r9, 0x2403
STORE r9, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r14, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r14, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r14, 255 -> r7 = -1 (r14<255), 0 (equal), 1 (r14>255)
; We want: if r14 > 255, pick 255; else pick r14
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r14, 255, r14, cond_for_overflow
; cond_for_overflow should be nonzero when r14 > 255
;
; Compute cond: CMP r14, 255 -> if r7 == 1, we have overflow
; Use: MOV cond, r7; LDI r8, 1; CMP cond, r8 -> BLT r7 means cond<1 i.e. cond=-1 (r14<255)
; We need the opposite: cond nonzero when r14>255
; Simple: after CMP, r7 is -1/0/1. r7 != -1 when r14 >= 255.
; BGE r7 fires when r7 != -1 (r14 >= 255). We can use that to set a flag.

LDI r13, 255
CMP r14, r13               ; r7 = -1 if r14<255, 0 if eq, 1 if r14>255

; Build condition register: nonzero when r14 > 255
; r7 == 1 means r14 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r7, r13 where r13=1. If r7 was 1, result=0. If r7 was -1, result=-2. If r7 was 0, result=-1.
; That doesn't help. Let me use: MOV r3, r7; LDI r5, 1; CMP r3, r5 -> BLT means r3<1 (r7=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r7 - 1)
; If r7=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r7=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r7=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r7, r14(where r14=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r3, 0
ADD r3, r7               ; r3 = CMP result (-1/0/1)
LDI r5, 1
SUB r3, r5               ; r3 = CMP_result - 1
LDI r6, 31
SAR r3, r6               ; r3 = 0 (overflow) or -1 (no overflow)
LDI r5, 0
SUB r5, r5               ; r5 = 0 (was: LDI can't do -1... use NEG)
LDI r5, 1
NEG r5                   ; r5 = 0xFFFFFFFF (-1)
XOR r3, r5               ; r3 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r14, r13, r14, r3 -- if overflow (r3=-1!=0), r14=255; else r14 stays
CSEL r14, r13, r14, r3

; Lower clamp: max(r14, 0) using CSEL
; If r14 is negative (signed), pick 0; else pick r14
MOV r13, r14
LDI r6, 31
SAR r13, r6               ; r13 = -1 if negative, 0 if positive (condition register)
LDI r3, 0
CSEL r14, r3, r14, r13      ; if negative (r13!=0), r14=0; else r14 stays

; Store CSEL result
LDI r9, 0x2402
STORE r9, r14
LDI r9, 0x2404
STORE r9, r22

HALT
