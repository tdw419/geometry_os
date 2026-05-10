; DESCRIPTION: Places a blue circle of radius 32 at center (119, 152).
; PLAN: r0=119(x), r1=152(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 152
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
