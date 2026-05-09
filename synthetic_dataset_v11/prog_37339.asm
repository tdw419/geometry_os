; DESCRIPTION: Creates a blue circular shape at (71, 148) with radius 51.
; PLAN: r0=71(x), r1=148(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 148
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
