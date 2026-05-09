; DESCRIPTION: Draws a purple rectangle at (25, 97) with width 68 and height 111.
; PLAN: r0=25(x), r1=97(y), r2=68(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 97
LDI r2, 68
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
