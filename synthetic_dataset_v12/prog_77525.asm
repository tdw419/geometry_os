; DESCRIPTION: Places a blue circle of radius 79 at center (136, 123).
; PLAN: r0=136(x), r1=123(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 123
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
