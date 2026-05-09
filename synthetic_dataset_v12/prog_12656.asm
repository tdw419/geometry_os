; DESCRIPTION: Draws a purple rectangle at (75, 37) with width 30 and height 52.
; PLAN: r0=75(x), r1=37(y), r2=30(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 37
LDI r2, 30
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
