; DESCRIPTION: Places a yellow circle of radius 51 at center (456, 200).
; PLAN: r0=456(x), r1=200(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 200
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
