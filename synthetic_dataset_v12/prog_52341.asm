; DESCRIPTION: Renders a black disk with center (211, 99) and radius 32.
; PLAN: r0=211(x), r1=99(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 99
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
