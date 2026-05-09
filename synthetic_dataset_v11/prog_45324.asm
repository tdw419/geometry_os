; DESCRIPTION: Renders a red disk with center (169, 155) and radius 79.
; PLAN: r0=169(x), r1=155(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 155
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
