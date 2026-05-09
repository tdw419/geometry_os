; DESCRIPTION: Renders a black disk with center (283, 71) and radius 32.
; PLAN: r0=283(x), r1=71(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 71
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
