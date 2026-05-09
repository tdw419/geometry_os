; DESCRIPTION: Renders a red disk with center (142, 80) and radius 23.
; PLAN: r0=142(x), r1=80(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 80
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
