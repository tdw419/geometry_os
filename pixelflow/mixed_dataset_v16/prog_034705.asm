; DESCRIPTION: Draws a blue rectangle at (259, 115) with width 22 and height 74.
; PLAN: r0=259(x), r1=115(y), r2=22(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 115
LDI r2, 22
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
