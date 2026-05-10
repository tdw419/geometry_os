; DESCRIPTION: Renders a green circular shape at (51, 109) with radius 30.
; PLAN: r0=51(x), r1=109(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 109
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
