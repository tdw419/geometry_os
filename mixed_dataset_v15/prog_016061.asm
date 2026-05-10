; DESCRIPTION: Renders a red circular shape at (266, 33) with radius 51.
; PLAN: r0=266(x), r1=33(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 33
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
