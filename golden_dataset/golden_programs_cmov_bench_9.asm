; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r7, 300           ; test value: overflows 255
LDI r3, 0x2400
STORE r3, r7         ; save input

; ========================================
; Approach 1: Branch-based clamp (traditional)
; ========================================
LDI r20, 0            ; step counter

; Upper clamp: if r7 > 255, set r7 = 255
LDI r12, 255
CMP r7, r12
; CMP sets r6: -1 if r7<r12, 0 if equal, 1 if r7>r12
; We want to clamp only when r7 > 255 (r6 == 1)
; Trick: compare r6 with 1. If r6 < 1 (i.e. r6 == -1), skip.
LDI r15, 1
CMP r15, r6            ; compare 1 vs CMP result
BGE r6, branch_clamp_hi  ; if 1 >= r6 (always true since r6 is -1,0,or1)
; Wait, that always fires. Let me use a simpler approach:
; BLT r6 means r6 == -1, which means r7 < 255 -> skip
JMP branch_hi_check
branch_clamp_hi:
LDI r7, 255
branch_hi_check:

; Actually, simplest correct approach: check if r7 < 255, skip; else clamp
; Reset and redo cleanly
LDI r7, 300
LDI r20, 0

; Upper clamp using BLT: if r7 < 255, skip
LDI r12, 255
CMP r7, r12
BLT r6, branch_lo       ; r7 < 255, skip upper clamp
LDI r7, 255              ; r7 >= 255, clamp

branch_lo:
; Lower clamp: if r7 is negative (signed), set to 0
; Test: shift sign bit down, check if nonzero
MOV r12, r7
LDI r15, 31
SAR r12, r15               ; r12 = all-ones if negative, all-zeros if positive
JZ r12, branch_done       ; if not negative, done
LDI r7, 0                ; clamp to 0

branch_done:
LDI r3, 0x2401
STORE r3, r7             ; save branch result
LDI r3, 0x2403
STORE r3, r20            ; save branch step count (0 = not instrumented precisely)

; ========================================
; Approach 2: CSEL-based clamp (branchless)
; ========================================
LDI r7, 300              ; reload test value
LDI r22, 0               ; step counter

; Upper clamp using CSEL: min(r7, 255)
; Strategy: compute a boolean mask, then CSEL
; CMP r7, 255 -> r6 = -1 (r7<255), 0 (equal), 1 (r7>255)
; We want: if r7 > 255, pick 255; else pick r7
; CSEL rd, rs_if_true, rs_if_false, cond
; So: CSEL r7, 255, r7, cond_for_overflow
; cond_for_overflow should be nonzero when r7 > 255
;
; Compute cond: CMP r7, 255 -> if r6 == 1, we have overflow
; Use: MOV cond, r6; LDI r15, 1; CMP cond, r15 -> BLT r6 means cond<1 i.e. cond=-1 (r7<255)
; We need the opposite: cond nonzero when r7>255
; Simple: after CMP, r6 is -1/0/1. r6 != -1 when r7 >= 255.
; BGE r6 fires when r6 != -1 (r7 >= 255). We can use that to set a flag.

LDI r12, 255
CMP r7, r12               ; r6 = -1 if r7<255, 0 if eq, 1 if r7>255

; Build condition register: nonzero when r7 > 255
; r6 == 1 means r7 > 255. We need a register that's nonzero only in that case.
; Trick: SUB r6, r12 where r12=1. If r6 was 1, result=0. If r6 was -1, result=-2. If r6 was 0, result=-1.
; That doesn't help. Let me use: MOV r11, r6; LDI r10, 1; CMP r11, r10 -> BLT means r11<1 (r6=-1 or 0)
; Actually simplest: use SAR to isolate the sign of (r6 - 1)
; If r6=1 (overflow): 1-1=0, SAR by 31 = 0 (not negative)
; If r6=0 (equal): 0-1=-1, SAR by 31 = -1 (negative)  
; If r6=-1 (less): -1-1=-2, SAR by 31 = -1 (negative)
; So after SUB r6, r7(where r7=1), SAR by 31: 0 = overflow, -1 = no overflow
; We want nonzero for overflow, so XOR with -1:
; XOR result, -1: 0 XOR -1 = -1 (overflow), -1 XOR -1 = 0 (no overflow)

LDI r11, 0
ADD r11, r6               ; r11 = CMP result (-1/0/1)
LDI r10, 1
SUB r11, r10               ; r11 = CMP_result - 1
LDI r14, 31
SAR r11, r14               ; r11 = 0 (overflow) or -1 (no overflow)
LDI r10, 0
SUB r10, r10               ; r10 = 0 (was: LDI can't do -1... use NEG)
LDI r10, 1
NEG r10                   ; r10 = 0xFFFFFFFF (-1)
XOR r11, r10               ; r11 = -1 (overflow) or 0 (no overflow) -- our condition!

; CSEL r7, r12, r7, r11 -- if overflow (r11=-1!=0), r7=255; else r7 stays
CSEL r7, r12, r7, r11

; Lower clamp: max(r7, 0) using CSEL
; If r7 is negative (signed), pick 0; else pick r7
MOV r12, r7
LDI r14, 31
SAR r12, r14               ; r12 = -1 if negative, 0 if positive (condition register)
LDI r11, 0
CSEL r7, r11, r7, r12      ; if negative (r12!=0), r7=0; else r7 stays

; Store CSEL result
LDI r3, 0x2402
STORE r3, r7
LDI r3, 0x2404
STORE r3, r22

HALT
