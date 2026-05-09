; DESCRIPTION: Draws a purple rectangle at (82, 144) with width 68 and height 97.
; PLAN: r0=82(x), r1=144(y), r2=68(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 144
LDI r2, 68
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
