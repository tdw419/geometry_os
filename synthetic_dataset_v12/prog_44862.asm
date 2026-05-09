; DESCRIPTION: Renders a blue box of size 84x96 starting at (366, 147).
; PLAN: r0=366(x), r1=147(y), r2=84(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 147
LDI r2, 84
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
