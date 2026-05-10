; DESCRIPTION: Draws a orange rectangle at (250, 39) with width 37 and height 89.
; PLAN: r0=250(x), r1=39(y), r2=37(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 39
LDI r2, 37
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
