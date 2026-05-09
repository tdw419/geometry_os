; DESCRIPTION: Draws a purple rectangle at (63, 188) with width 104 and height 64.
; PLAN: r0=63(x), r1=188(y), r2=104(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 188
LDI r2, 104
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
