; DESCRIPTION: Draws a green rectangle at (341, 179) with width 12 and height 88.
; PLAN: r0=341(x), r1=179(y), r2=12(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 179
LDI r2, 12
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
