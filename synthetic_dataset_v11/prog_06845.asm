; DESCRIPTION: Renders a red disk with center (182, 169) and radius 51.
; PLAN: r0=182(x), r1=169(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 169
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
