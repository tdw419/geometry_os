; DESCRIPTION: Renders a red circular shape at (285, 102) with radius 12.
; PLAN: r0=285(x), r1=102(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 102
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
