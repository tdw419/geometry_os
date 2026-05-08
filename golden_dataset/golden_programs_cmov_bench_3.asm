; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
LDI r6, 300           ; test value: overflows 255
LDI r1, 0x2400
STORE r1, r6         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r6 > 255, set r6 = 255
LDI r14, 255
CMP r6, r14
; CMP sets r4: -1 if r6<r14, 0 if equal, 1 if r6>r14
; We want to clamp only when r6 > 255 (r4 == 1)
; Trick: compare r4 with 1. If r4 < 1 (i.e. r4 == -1), skip.
LDI r15, 1
CMP r15, r4            ; compare 1 vs CMP result
BGE r4, branch_clamp_hi  ; if 1 >= r4 (always true since r4 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r4 means r4 == -1, which means r6 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r6, 255
branch_hi_check:

; Actually, simplest correct approach: check if r6 < 255, skip; else clamp
; Reset and redo cleanly
LDI r6, 300
LDI r20, 0

; Upper clamp using BLT: if r6 < 255, skip
LDI r14, 255
CMP r6, r14
BLT r4, branch_lo       ; r6 < 255, skip upper clamp
LDI r6, 255              ; r6 >= 255, clamp

branch_lo:
; Lower clamp: if r6 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r14, r6
LDI r15, 31
SAR r14, r15               ; r14 = all-ones if negative, all-zeros if positive
JZ r14, branch_done       ; if not negative, done
LDI r6, 0                ; clamp to 0

branch_done:
LDI r1, 0x2401
STORE r1, r6             ; save branch result
LDI r1, 0x2403
STORE r1, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r6, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r6, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r6, 255 -> r4 = -1 (r6<255), 0 (equal), 1 (r6>255)
; We want: if r6 > 255, pick 255; else pick r6
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r6, 255, r6, cond_for_overflow
; cond_for_overflow should be nonzero when r6 > 255
;
; Compute cond: CMP r6, 255 -> if r4 == 1, we have overflow
; Use: MOV cond, r4; LDI r15, 1; CMP cond, r15 -> BLT r4 means cond<1 i.e. cond=-1 (r6<255)
; We need the opposite: cond nonzero when r6>255
; Simple: after CMP, r4 is -1/0/1. r4 != -1 when r6 >= 255.
; BGE r4 fires when r4 != -1 (r6 >= 255). We can use that to set a flag.

LDI r14, 255
CMP r6, r14               ; r4 = -1 if r6<255, 0 if eq, 1 if r6>255

; Build condition register: nonzero when r6 > 255
; r4 == 1 means r6 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r4, r14 where r14=1. If r4 was 1, result=0. If r4 was -1, result=-2. If r4 was 0, result=-1.
; That doesn't help. Let me use: MOV r7, r4; LDI r9, 1; CMP r7, r9 -> BLT means r7<1 (r4=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r4 - 1)
; If r4=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r4=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r4=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r4, r6(where r6=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r7, 0
ADD r7, r4               ; r7 = CMP result (-1/0/1)
LDI r9, 1
SUB r7, r9               ; r7 = CMP_result - 1
LDI r0, 31
SAR r7, r0               ; r7 = 0 (overflow) or -1 (no overflow)
LDI r9, 0
SUB r9, r9               ; r9 = 0 (was: LDI can't do -1... use NEG)
LDI r9, 1
NEG r9                   ; r9 = 0xFFFFFFFF (-1)
XOR r7, r9               ; r7 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r6, r14, r6, r7 -- if overflow (r7=-1!=0), r6=255; else r6 stays
CSEL r6, r14, r6, r7

; Lower clamp: max(r6, 0) using CSEL
; If r6 is negative (signed), pick 0; else pick r6
MOV r14, r6
LDI r0, 31
SAR r14, r0               ; r14 = -1 if negative, 0 if positive (condition register)
LDI r7, 0
CSEL r6, r7, r6, r14      ; if negative (r14!=0), r6=0; else r6 stays

; Store CSEL result
LDI r1, 0x2402
STORE r1, r6
LDI r1, 0x2404
STORE r1, r22

HALT
