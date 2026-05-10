; DESCRIPTION: Draws a green rectangle at (130, 100) with width 99 and height 114.
; PLAN: r0=130(x), r1=100(y), r2=99(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 100
LDI r2, 99
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
