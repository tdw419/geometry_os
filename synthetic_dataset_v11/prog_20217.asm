; DESCRIPTION: Draws a green rectangle at (133, 142) with width 63 and height 110.
; PLAN: r0=133(x), r1=142(y), r2=63(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 142
LDI r2, 63
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
