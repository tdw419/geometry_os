; DESCRIPTION: Renders a black disk with center (242, 110) and radius 64.
; PLAN: r0=242(x), r1=110(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 110
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
