; DESCRIPTION: Renders a red disk with center (88, 75) and radius 61.
; PLAN: r0=88(x), r1=75(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 75
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
