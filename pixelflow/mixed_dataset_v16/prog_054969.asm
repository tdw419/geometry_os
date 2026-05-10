; DESCRIPTION: Draws a purple rectangle at (391, 79) with width 78 and height 51.
; PLAN: r0=391(x), r1=79(y), r2=78(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 79
LDI r2, 78
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
