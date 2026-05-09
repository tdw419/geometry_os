; DESCRIPTION: Renders a black disk with center (165, 162) and radius 18.
; PLAN: r0=165(x), r1=162(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 162
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
