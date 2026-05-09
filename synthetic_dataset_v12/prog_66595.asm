; DESCRIPTION: Draws a purple rectangle at (0, 16) with width 63 and height 106.
; PLAN: r0=0(x), r1=16(y), r2=63(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 16
LDI r2, 63
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
