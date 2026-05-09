; DESCRIPTION: Places a yellow circle of radius 48 at center (55, 80).
; PLAN: r0=55(x), r1=80(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 80
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
