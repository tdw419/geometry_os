; DESCRIPTION: Renders a black disk with center (116, 170) and radius 56.
; PLAN: r0=116(x), r1=170(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 170
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
