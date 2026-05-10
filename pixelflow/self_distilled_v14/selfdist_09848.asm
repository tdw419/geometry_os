; DESCRIPTION: Renders a red circular shape at (355, 137) with radius 73.
; PLAN: r0=355(x), r1=137(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 137
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
