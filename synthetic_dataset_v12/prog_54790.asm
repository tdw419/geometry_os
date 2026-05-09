; DESCRIPTION: Creates a yellow circular shape at (476, 51) with radius 25.
; PLAN: r0=476(x), r1=51(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 51
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
