; DESCRIPTION: Renders a red disk with center (341, 162) and radius 73.
; PLAN: r0=341(x), r1=162(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 162
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
