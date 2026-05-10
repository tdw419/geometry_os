; DESCRIPTION: Draws a blue rectangle at (157, 132) with width 81 and height 13.
; PLAN: r0=157(x), r1=132(y), r2=81(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 132
LDI r2, 81
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
