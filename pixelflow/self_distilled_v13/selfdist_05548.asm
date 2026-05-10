; DESCRIPTION: Places a yellow disk with center (273, 109) and radius 51.
; PLAN: r0=273(x), r1=109(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 109
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
