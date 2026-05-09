; DESCRIPTION: Renders a red disk with center (283, 185) and radius 11.
; PLAN: r0=283(x), r1=185(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 185
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
