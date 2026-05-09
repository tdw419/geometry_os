; DESCRIPTION: Draws a purple rectangle at (209, 118) with width 30 and height 32.
; PLAN: r0=209(x), r1=118(y), r2=30(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 118
LDI r2, 30
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
