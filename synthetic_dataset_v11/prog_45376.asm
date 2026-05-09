; DESCRIPTION: Renders a blue box of size 63x57 starting at (84, 147).
; PLAN: r0=84(x), r1=147(y), r2=63(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 147
LDI r2, 63
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
