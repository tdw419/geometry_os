; DESCRIPTION: Draws a black rectangle at (81, 65) with width 34 and height 20.
; PLAN: r0=81(x), r1=65(y), r2=34(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 65
LDI r2, 34
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
