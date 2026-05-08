; DESCRIPTION: Render a colored object at the screen.

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
LDI r8, 300           ; test value: overflows 255
LDI r2, 0x2400
STORE r2, r8         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r8 > 255, set r8 = 255
LDI r12, 255
CMP r8, r12
; CMP sets r11: -1 if r8<r12, 0 if equal, 1 if r8>r12
; We want to clamp only when r8 > 255 (r11 == 1)
; Trick: compare r11 with 1. If r11 < 1 (i.e. r11 == -1), skip.
LDI r13, 1
CMP r13, r11            ; compare 1 vs CMP result
BGE r11, branch_clamp_hi  ; if 1 >= r11 (always true since r11 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r11 means r11 == -1, which means r8 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r8, 255
branch_hi_check:

; Actually, simplest correct approach: check if r8 < 255, skip; else clamp
; Reset and redo cleanly
LDI r8, 300
LDI r20, 0

; Upper clamp using BLT: if r8 < 255, skip
LDI r12, 255
CMP r8, r12
BLT r11, branch_lo       ; r8 < 255, skip upper clamp
LDI r8, 255              ; r8 >= 255, clamp

branch_lo:
; Lower clamp: if r8 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r12, r8
LDI r13, 31
SAR r12, r13               ; r12 = all-ones if negative, all-zeros if positive
JZ r12, branch_done       ; if not negative, done
LDI r8, 0                ; clamp to 0

branch_done:
LDI r2, 0x2401
STORE r2, r8             ; save branch result
LDI r2, 0x2403
STORE r2, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r8, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r8, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r8, 255 -> r11 = -1 (r8<255), 0 (equal), 1 (r8>255)
; We want: if r8 > 255, pick 255; else pick r8
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r8, 255, r8, cond_for_overflow
; cond_for_overflow should be nonzero when r8 > 255
;
; Compute cond: CMP r8, 255 -> if r11 == 1, we have overflow
; Use: MOV cond, r11; LDI r13, 1; CMP cond, r13 -> BLT r11 means cond<1 i.e. cond=-1 (r8<255)
; We need the opposite: cond nonzero when r8>255
; Simple: after CMP, r11 is -1/0/1. r11 != -1 when r8 >= 255.
; BGE r11 fires when r11 != -1 (r8 >= 255). We can use that to set a flag.

LDI r12, 255
CMP r8, r12               ; r11 = -1 if r8<255, 0 if eq, 1 if r8>255

; Build condition register: nonzero when r8 > 255
; r11 == 1 means r8 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r11, r12 where r12=1. If r11 was 1, result=0. If r11 was -1, result=-2. If r11 was 0, result=-1.
; That doesn't help. Let me use: MOV r3, r11; LDI r7, 1; CMP r3, r7 -> BLT means r3<1 (r11=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r11 - 1)
; If r11=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r11=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r11=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r11, r8(where r8=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r3, 0
ADD r3, r11               ; r3 = CMP result (-1/0/1)
LDI r7, 1
SUB r3, r7               ; r3 = CMP_result - 1
LDI r1, 31
SAR r3, r1               ; r3 = 0 (overflow) or -1 (no overflow)
LDI r7, 0
SUB r7, r7               ; r7 = 0 (was: LDI can't do -1... use NEG)
LDI r7, 1
NEG r7                   ; r7 = 0xFFFFFFFF (-1)
XOR r3, r7               ; r3 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r8, r12, r8, r3 -- if overflow (r3=-1!=0), r8=255; else r8 stays
CSEL r8, r12, r8, r3

; Lower clamp: max(r8, 0) using CSEL
; If r8 is negative (signed), pick 0; else pick r8
MOV r12, r8
LDI r1, 31
SAR r12, r1               ; r12 = -1 if negative, 0 if positive (condition register)
LDI r3, 0
CSEL r8, r3, r8, r12      ; if negative (r12!=0), r8=0; else r8 stays

; Store CSEL result
LDI r2, 0x2402
STORE r2, r8
LDI r2, 0x2404
STORE r2, r22

HALT
