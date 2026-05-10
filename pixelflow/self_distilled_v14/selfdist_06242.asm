; DESCRIPTION: Renders a red circular shape at (111, 11) with radius 79.
; PLAN: r0=111(x), r1=11(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 11
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
