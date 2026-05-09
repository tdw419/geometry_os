; DESCRIPTION: Draws a purple rectangle at (272, 117) with width 80 and height 53.
; PLAN: r0=272(x), r1=117(y), r2=80(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 117
LDI r2, 80
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
