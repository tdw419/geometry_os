; DESCRIPTION: Draws a orange rectangle at (73, 8) with width 80 and height 107.
; PLAN: r0=73(x), r1=8(y), r2=80(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 8
LDI r2, 80
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
