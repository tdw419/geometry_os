; DESCRIPTION: Draws a purple rectangle at (180, 19) with width 47 and height 75.
; PLAN: r0=180(x), r1=19(y), r2=47(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 19
LDI r2, 47
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
