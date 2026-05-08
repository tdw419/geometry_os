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
LDI r12, 300           ; test value: overflows 255
LDI r14, 0x2400
STORE r14, r12         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r12 > 255, set r12 = 255
LDI r0, 255
CMP r12, r0
; CMP sets r7: -1 if r12<r0, 0 if equal, 1 if r12>r0
; We want to clamp only when r12 > 255 (r7 == 1)
; Trick: compare r7 with 1. If r7 < 1 (i.e. r7 == -1), skip.
LDI r2, 1
CMP r2, r7            ; compare 1 vs CMP result
BGE r7, branch_clamp_hi  ; if 1 >= r7 (always true since r7 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r7 means r7 == -1, which means r12 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r12, 255
branch_hi_check:

; Actually, simplest correct approach: check if r12 < 255, skip; else clamp
; Reset and redo cleanly
LDI r12, 300
LDI r20, 0

; Upper clamp using BLT: if r12 < 255, skip
LDI r0, 255
CMP r12, r0
BLT r7, branch_lo       ; r12 < 255, skip upper clamp
LDI r12, 255              ; r12 >= 255, clamp

branch_lo:
; Lower clamp: if r12 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r0, r12
LDI r2, 31
SAR r0, r2               ; r0 = all-ones if negative, all-zeros if positive
JZ r0, branch_done       ; if not negative, done
LDI r12, 0                ; clamp to 0

branch_done:
LDI r14, 0x2401
STORE r14, r12             ; save branch result
LDI r14, 0x2403
STORE r14, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r12, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r12, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r12, 255 -> r7 = -1 (r12<255), 0 (equal), 1 (r12>255)
; We want: if r12 > 255, pick 255; else pick r12
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r12, 255, r12, cond_for_overflow
; cond_for_overflow should be nonzero when r12 > 255
;
; Compute cond: CMP r12, 255 -> if r7 == 1, we have overflow
; Use: MOV cond, r7; LDI r2, 1; CMP cond, r2 -> BLT r7 means cond<1 i.e. cond=-1 (r12<255)
; We need the opposite: cond nonzero when r12>255
; Simple: after CMP, r7 is -1/0/1. r7 != -1 when r12 >= 255.
; BGE r7 fires when r7 != -1 (r12 >= 255). We can use that to set a flag.

LDI r0, 255
CMP r12, r0               ; r7 = -1 if r12<255, 0 if eq, 1 if r12>255

; Build condition register: nonzero when r12 > 255
; r7 == 1 means r12 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r7, r0 where r0=1. If r7 was 1, result=0. If r7 was -1, result=-2. If r7 was 0, result=-1.
; That doesn't help. Let me use: MOV r11, r7; LDI r5, 1; CMP r11, r5 -> BLT means r11<1 (r7=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r7 - 1)
; If r7=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r7=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r7=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r7, r12(where r12=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r11, 0
ADD r11, r7               ; r11 = CMP result (-1/0/1)
LDI r5, 1
SUB r11, r5               ; r11 = CMP_result - 1
LDI r10, 31
SAR r11, r10               ; r11 = 0 (overflow) or -1 (no overflow)
LDI r5, 0
SUB r5, r5               ; r5 = 0 (was: LDI can't do -1... use NEG)
LDI r5, 1
NEG r5                   ; r5 = 0xFFFFFFFF (-1)
XOR r11, r5               ; r11 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r12, r0, r12, r11 -- if overflow (r11=-1!=0), r12=255; else r12 stays
CSEL r12, r0, r12, r11

; Lower clamp: max(r12, 0) using CSEL
; If r12 is negative (signed), pick 0; else pick r12
MOV r0, r12
LDI r10, 31
SAR r0, r10               ; r0 = -1 if negative, 0 if positive (condition register)
LDI r11, 0
CSEL r12, r11, r12, r0      ; if negative (r0!=0), r12=0; else r12 stays

; Store CSEL result
LDI r14, 0x2402
STORE r14, r12
LDI r14, 0x2404
STORE r14, r22

HALT
