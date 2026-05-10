; DESCRIPTION: Renders a red circular shape at (376, 193) with radius 49.
; PLAN: r0=376(x), r1=193(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 193
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
