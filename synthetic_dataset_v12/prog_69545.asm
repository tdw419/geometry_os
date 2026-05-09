; DESCRIPTION: Renders a red disk with center (79, 155) and radius 47.
; PLAN: r0=79(x), r1=155(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 155
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
