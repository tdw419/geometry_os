; DESCRIPTION: Draws a purple rectangle at (5, 24) with width 120 and height 118.
; PLAN: r0=5(x), r1=24(y), r2=120(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 24
LDI r2, 120
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
