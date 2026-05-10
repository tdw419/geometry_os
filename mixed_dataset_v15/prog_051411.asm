; DESCRIPTION: Renders a red circular shape at (385, 177) with radius 11.
; PLAN: r0=385(x), r1=177(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 177
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
