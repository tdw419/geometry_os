; DESCRIPTION: Draws a green rectangle at (3, 15) with width 96 and height 109.
; PLAN: r0=3(x), r1=15(y), r2=96(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 15
LDI r2, 96
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
