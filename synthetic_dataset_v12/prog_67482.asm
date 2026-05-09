; DESCRIPTION: Draws a purple rectangle at (100, 180) with width 39 and height 56.
; PLAN: r0=100(x), r1=180(y), r2=39(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 180
LDI r2, 39
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
