; DESCRIPTION: Places a yellow circle of radius 64 at center (110, 136).
; PLAN: r0=110(x), r1=136(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 136
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
