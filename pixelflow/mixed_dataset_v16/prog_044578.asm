; DESCRIPTION: Draws a purple rectangle at (80, 66) with width 99 and height 57.
; PLAN: r0=80(x), r1=66(y), r2=99(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 66
LDI r2, 99
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
