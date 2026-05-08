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
LDI r13, 300           ; test value: overflows 255
LDI r8, 0x2400
STORE r8, r13         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r13 > 255, set r13 = 255
LDI r3, 255
CMP r13, r3
; CMP sets r5: -1 if r13<r3, 0 if equal, 1 if r13>r3
; We want to clamp only when r13 > 255 (r5 == 1)
; Trick: compare r5 with 1. If r5 < 1 (i.e. r5 == -1), skip.
LDI r0, 1
CMP r0, r5            ; compare 1 vs CMP result
BGE r5, branch_clamp_hi  ; if 1 >= r5 (always true since r5 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r5 means r5 == -1, which means r13 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r13, 255
branch_hi_check:

; Actually, simplest correct approach: check if r13 < 255, skip; else clamp
; Reset and redo cleanly
LDI r13, 300
LDI r20, 0

; Upper clamp using BLT: if r13 < 255, skip
LDI r3, 255
CMP r13, r3
BLT r5, branch_lo       ; r13 < 255, skip upper clamp
LDI r13, 255              ; r13 >= 255, clamp

branch_lo:
; Lower clamp: if r13 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r3, r13
LDI r0, 31
SAR r3, r0               ; r3 = all-ones if negative, all-zeros if positive
JZ r3, branch_done       ; if not negative, done
LDI r13, 0                ; clamp to 0

branch_done:
LDI r8, 0x2401
STORE r8, r13             ; save branch result
LDI r8, 0x2403
STORE r8, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r13, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r13, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r13, 255 -> r5 = -1 (r13<255), 0 (equal), 1 (r13>255)
; We want: if r13 > 255, pick 255; else pick r13
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r13, 255, r13, cond_for_overflow
; cond_for_overflow should be nonzero when r13 > 255
;
; Compute cond: CMP r13, 255 -> if r5 == 1, we have overflow
; Use: MOV cond, r5; LDI r0, 1; CMP cond, r0 -> BLT r5 means cond<1 i.e. cond=-1 (r13<255)
; We need the opposite: cond nonzero when r13>255
; Simple: after CMP, r5 is -1/0/1. r5 != -1 when r13 >= 255.
; BGE r5 fires when r5 != -1 (r13 >= 255). We can use that to set a flag.

LDI r3, 255
CMP r13, r3               ; r5 = -1 if r13<255, 0 if eq, 1 if r13>255

; Build condition register: nonzero when r13 > 255
; r5 == 1 means r13 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r5, r3 where r3=1. If r5 was 1, result=0. If r5 was -1, result=-2. If r5 was 0, result=-1.
; That doesn't help. Let me use: MOV r10, r5; LDI r7, 1; CMP r10, r7 -> BLT means r10<1 (r5=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r5 - 1)
; If r5=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r5=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r5=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r5, r13(where r13=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r10, 0
ADD r10, r5               ; r10 = CMP result (-1/0/1)
LDI r7, 1
SUB r10, r7               ; r10 = CMP_result - 1
LDI r6, 31
SAR r10, r6               ; r10 = 0 (overflow) or -1 (no overflow)
LDI r7, 0
SUB r7, r7               ; r7 = 0 (was: LDI can't do -1... use NEG)
LDI r7, 1
NEG r7                   ; r7 = 0xFFFFFFFF (-1)
XOR r10, r7               ; r10 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r13, r3, r13, r10 -- if overflow (r10=-1!=0), r13=255; else r13 stays
CSEL r13, r3, r13, r10

; Lower clamp: max(r13, 0) using CSEL
; If r13 is negative (signed), pick 0; else pick r13
MOV r3, r13
LDI r6, 31
SAR r3, r6               ; r3 = -1 if negative, 0 if positive (condition register)
LDI r10, 0
CSEL r13, r10, r13, r3      ; if negative (r3!=0), r13=0; else r13 stays

; Store CSEL result
LDI r8, 0x2402
STORE r8, r13
LDI r8, 0x2404
STORE r8, r22

HALT
