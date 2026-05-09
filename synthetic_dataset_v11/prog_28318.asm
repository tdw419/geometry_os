; DESCRIPTION: Renders a red disk with center (155, 46) and radius 13.
; PLAN: r0=155(x), r1=46(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 46
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
