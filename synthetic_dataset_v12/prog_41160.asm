; DESCRIPTION: Renders a black disk with center (279, 91) and radius 80.
; PLAN: r0=279(x), r1=91(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 91
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
