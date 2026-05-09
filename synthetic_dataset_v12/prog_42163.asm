; DESCRIPTION: Renders a red disk with center (283, 119) and radius 36.
; PLAN: r0=283(x), r1=119(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 119
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
