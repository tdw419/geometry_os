; DESCRIPTION: Draws a purple rectangle at (126, 200) with width 15 and height 10.
; PLAN: r0=126(x), r1=200(y), r2=15(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 200
LDI r2, 15
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
