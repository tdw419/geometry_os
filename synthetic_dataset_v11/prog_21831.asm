; DESCRIPTION: Renders a red disk with center (139, 61) and radius 18.
; PLAN: r0=139(x), r1=61(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 61
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
