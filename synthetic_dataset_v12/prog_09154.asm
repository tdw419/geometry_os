; DESCRIPTION: Draws a purple rectangle at (50, 1) with width 115 and height 74.
; PLAN: r0=50(x), r1=1(y), r2=115(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 1
LDI r2, 115
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
