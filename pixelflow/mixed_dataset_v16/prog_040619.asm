; DESCRIPTION: Places a white disk with center (51, 18) and radius 51.
; PLAN: r0=51(x), r1=18(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 18
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
