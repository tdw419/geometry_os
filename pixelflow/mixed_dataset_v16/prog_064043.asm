; DESCRIPTION: Draws a purple rectangle at (328, 48) with width 97 and height 86.
; PLAN: r0=328(x), r1=48(y), r2=97(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 48
LDI r2, 97
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
