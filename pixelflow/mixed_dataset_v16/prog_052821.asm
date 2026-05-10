; DESCRIPTION: Draws a purple rectangle at (189, 34) with width 20 and height 63.
; PLAN: r0=189(x), r1=34(y), r2=20(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 34
LDI r2, 20
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
