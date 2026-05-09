; DESCRIPTION: Draws a blue rectangle at (128, 158) with width 96 and height 58.
; PLAN: r0=128(x), r1=158(y), r2=96(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 158
LDI r2, 96
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
