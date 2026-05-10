; DESCRIPTION: Draws a black rectangle at (205, 20) with width 24 and height 118.
; PLAN: r0=205(x), r1=20(y), r2=24(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 20
LDI r2, 24
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
