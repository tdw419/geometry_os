; DESCRIPTION: Draws a purple rectangle at (221, 157) with width 63 and height 21.
; PLAN: r0=221(x), r1=157(y), r2=63(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 157
LDI r2, 63
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
