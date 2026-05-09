; DESCRIPTION: Places a yellow circle of radius 73 at center (321, 75).
; PLAN: r0=321(x), r1=75(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 75
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
