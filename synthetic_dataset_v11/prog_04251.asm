; DESCRIPTION: Creates a orange circular shape at (142, 189) with radius 51.
; PLAN: r0=142(x), r1=189(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 189
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
