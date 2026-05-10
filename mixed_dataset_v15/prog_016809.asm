; DESCRIPTION: Draws a purple rectangle at (379, 74) with width 75 and height 22.
; PLAN: r0=379(x), r1=74(y), r2=75(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 74
LDI r2, 75
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
