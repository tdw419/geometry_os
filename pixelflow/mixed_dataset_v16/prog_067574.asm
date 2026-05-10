; DESCRIPTION: Renders a blue box of size 81x80 starting at (325, 13).
; PLAN: r0=325(x), r1=13(y), r2=81(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 13
LDI r2, 81
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
