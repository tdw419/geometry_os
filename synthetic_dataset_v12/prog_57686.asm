; DESCRIPTION: Draws a green rectangle at (88, 2) with width 81 and height 64.
; PLAN: r0=88(x), r1=2(y), r2=81(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 2
LDI r2, 81
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
