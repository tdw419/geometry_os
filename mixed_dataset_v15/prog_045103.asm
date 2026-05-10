; DESCRIPTION: Renders a orange circular shape at (58, 119) with radius 51.
; PLAN: r0=58(x), r1=119(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 119
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
