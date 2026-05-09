; DESCRIPTION: Places a yellow circle of radius 51 at center (253, 60).
; PLAN: r0=253(x), r1=60(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 60
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
