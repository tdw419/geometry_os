; DESCRIPTION: Creates a blue circular shape at (136, 109) with radius 79.
; PLAN: r0=136(x), r1=109(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 109
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
