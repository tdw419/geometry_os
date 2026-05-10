; DESCRIPTION: Draws a white rectangle at (158, 88) with width 32 and height 25.
; PLAN: r0=158(x), r1=88(y), r2=32(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 88
LDI r2, 32
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
