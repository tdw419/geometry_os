; DESCRIPTION: Draws a purple rectangle at (91, 157) with width 30 and height 94.
; PLAN: r0=91(x), r1=157(y), r2=30(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 157
LDI r2, 30
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
