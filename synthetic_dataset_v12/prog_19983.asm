; DESCRIPTION: Places a black circle of radius 51 at center (88, 186).
; PLAN: r0=88(x), r1=186(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 186
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
