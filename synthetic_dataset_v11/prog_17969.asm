; DESCRIPTION: Places a yellow circle of radius 48 at center (124, 75).
; PLAN: r0=124(x), r1=75(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 75
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
