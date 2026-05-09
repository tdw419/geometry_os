; DESCRIPTION: Places a yellow circle of radius 51 at center (291, 142).
; PLAN: r0=291(x), r1=142(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 142
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
