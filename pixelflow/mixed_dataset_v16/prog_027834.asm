; DESCRIPTION: Draws a orange rectangle at (441, 112) with width 39 and height 107.
; PLAN: r0=441(x), r1=112(y), r2=39(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 112
LDI r2, 39
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
