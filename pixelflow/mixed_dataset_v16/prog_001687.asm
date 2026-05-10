; DESCRIPTION: Places a yellow circle of radius 18 at center (459, 51).
; PLAN: r0=459(x), r1=51(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 51
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
