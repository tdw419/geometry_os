; DESCRIPTION: Draws a green rectangle at (14, 54) with width 99 and height 81.
; PLAN: r0=14(x), r1=54(y), r2=99(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 54
LDI r2, 99
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
