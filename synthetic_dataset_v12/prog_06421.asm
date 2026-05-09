; DESCRIPTION: Renders a blue box of size 101x79 starting at (358, 149).
; PLAN: r0=358(x), r1=149(y), r2=101(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 149
LDI r2, 101
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
