; DESCRIPTION: Draws a orange rectangle at (6, 71) with width 96 and height 23.
; PLAN: r0=6(x), r1=71(y), r2=96(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 71
LDI r2, 96
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
