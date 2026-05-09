; DESCRIPTION: Draws a purple rectangle at (126, 174) with width 35 and height 75.
; PLAN: r0=126(x), r1=174(y), r2=35(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 174
LDI r2, 35
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
