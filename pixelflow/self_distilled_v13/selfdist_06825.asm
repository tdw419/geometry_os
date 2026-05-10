; DESCRIPTION: Renders a red circular shape at (388, 107) with radius 71.
; PLAN: r0=388(x), r1=107(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 107
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
