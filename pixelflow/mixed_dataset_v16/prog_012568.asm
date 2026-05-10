; DESCRIPTION: Places a yellow circle of radius 43 at center (448, 55).
; PLAN: r0=448(x), r1=55(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 55
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
