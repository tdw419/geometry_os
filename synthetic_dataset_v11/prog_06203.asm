; DESCRIPTION: Draws a purple rectangle at (180, 5) with width 30 and height 39.
; PLAN: r0=180(x), r1=5(y), r2=30(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 5
LDI r2, 30
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
