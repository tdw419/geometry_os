; DESCRIPTION: Renders a blue box of size 63x79 starting at (322, 1).
; PLAN: r0=322(x), r1=1(y), r2=63(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 1
LDI r2, 63
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
