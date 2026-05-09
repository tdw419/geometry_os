; DESCRIPTION: Draws a purple rectangle at (85, 55) with width 90 and height 52.
; PLAN: r0=85(x), r1=55(y), r2=90(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 55
LDI r2, 90
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
