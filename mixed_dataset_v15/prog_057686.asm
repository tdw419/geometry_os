; DESCRIPTION: Draws a purple rectangle at (205, 115) with width 65 and height 26.
; PLAN: r0=205(x), r1=115(y), r2=65(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 115
LDI r2, 65
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
