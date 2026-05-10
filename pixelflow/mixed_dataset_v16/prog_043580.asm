; DESCRIPTION: Renders a red circular shape at (211, 45) with radius 33.
; PLAN: r0=211(x), r1=45(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 45
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
