; DESCRIPTION: Renders a red disk with center (357, 58) and radius 26.
; PLAN: r0=357(x), r1=58(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 58
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
