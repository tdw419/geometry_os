; DESCRIPTION: Draws a purple rectangle at (212, 65) with width 18 and height 107.
; PLAN: r0=212(x), r1=65(y), r2=18(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 65
LDI r2, 18
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
