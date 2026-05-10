; DESCRIPTION: Draws a purple rectangle at (195, 50) with width 51 and height 51.
; PLAN: r0=195(x), r1=50(y), r2=51(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 50
LDI r2, 51
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
