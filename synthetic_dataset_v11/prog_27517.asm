; DESCRIPTION: Draws a purple rectangle at (6, 180) with width 90 and height 70.
; PLAN: r0=6(x), r1=180(y), r2=90(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 180
LDI r2, 90
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
