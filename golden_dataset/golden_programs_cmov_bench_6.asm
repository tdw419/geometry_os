; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r5, 300           ; test value: overflows 255
LDI r9, 0x2400
STORE r9, r5         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r5 > 255, set r5 = 255
LDI r6, 255
CMP r5, r6
; CMP sets r15: -1 if r5<r6, 0 if equal, 1 if r5>r6
; We want to clamp only when r5 > 255 (r15 == 1)
; Trick: compare r15 with 1. If r15 < 1 (i.e. r15 == -1), skip.
LDI r8, 1
CMP r8, r15            ; compare 1 vs CMP result
BGE r15, branch_clamp_hi  ; if 1 >= r15 (always true since r15 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r15 means r15 == -1, which means r5 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r5, 255
branch_hi_check:

; Actually, simplest correct approach: check if r5 < 255, skip; else clamp
; Reset and redo cleanly
LDI r5, 300
LDI r20, 0

; Upper clamp using BLT: if r5 < 255, skip
LDI r6, 255
CMP r5, r6
BLT r15, branch_lo       ; r5 < 255, skip upper clamp
LDI r5, 255              ; r5 >= 255, clamp

branch_lo:
; Lower clamp: if r5 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r6, r5
LDI r8, 31
SAR r6, r8               ; r6 = all-ones if negative, all-zeros if positive
JZ r6, branch_done       ; if not negative, done
LDI r5, 0                ; clamp to 0

branch_done:
LDI r9, 0x2401
STORE r9, r5             ; save branch result
LDI r9, 0x2403
STORE r9, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r5, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r5, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r5, 255 -> r15 = -1 (r5<255), 0 (equal), 1 (r5>255)
; We want: if r5 > 255, pick 255; else pick r5
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r5, 255, r5, cond_for_overflow
; cond_for_overflow should be nonzero when r5 > 255
;
; Compute cond: CMP r5, 255 -> if r15 == 1, we have overflow
; Use: MOV cond, r15; LDI r8, 1; CMP cond, r8 -> BLT r15 means cond<1 i.e. cond=-1 (r5<255)
; We need the opposite: cond nonzero when r5>255
; Simple: after CMP, r15 is -1/0/1. r15 != -1 when r5 >= 255.
; BGE r15 fires when r15 != -1 (r5 >= 255). We can use that to set a flag.

LDI r6, 255
CMP r5, r6               ; r15 = -1 if r5<255, 0 if eq, 1 if r5>255

; Build condition register: nonzero when r5 > 255
; r15 == 1 means r5 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r15, r6 where r6=1. If r15 was 1, result=0. If r15 was -1, result=-2. If r15 was 0, result=-1.
; That doesn't help. Let me use: MOV r3, r15; LDI r11, 1; CMP r3, r11 -> BLT means r3<1 (r15=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r15 - 1)
; If r15=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r15=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r15=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r15, r5(where r5=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r3, 0
ADD r3, r15               ; r3 = CMP result (-1/0/1)
LDI r11, 1
SUB r3, r11               ; r3 = CMP_result - 1
LDI r4, 31
SAR r3, r4               ; r3 = 0 (overflow) or -1 (no overflow)
LDI r11, 0
SUB r11, r11               ; r11 = 0 (was: LDI can't do -1... use NEG)
LDI r11, 1
NEG r11                   ; r11 = 0xFFFFFFFF (-1)
XOR r3, r11               ; r3 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r5, r6, r5, r3 -- if overflow (r3=-1!=0), r5=255; else r5 stays
CSEL r5, r6, r5, r3

; Lower clamp: max(r5, 0) using CSEL
; If r5 is negative (signed), pick 0; else pick r5
MOV r6, r5
LDI r4, 31
SAR r6, r4               ; r6 = -1 if negative, 0 if positive (condition register)
LDI r3, 0
CSEL r5, r3, r5, r6      ; if negative (r6!=0), r5=0; else r5 stays

; Store CSEL result
LDI r9, 0x2402
STORE r9, r5
LDI r9, 0x2404
STORE r9, r22

HALT
