; DESCRIPTION: Draws a purple rectangle at (21, 89) with width 48 and height 97.
; PLAN: r0=21(x), r1=89(y), r2=48(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 89
LDI r2, 48
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
