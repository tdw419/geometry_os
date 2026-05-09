; DESCRIPTION: Renders a blue disk with center (242, 88) and radius 73.
; PLAN: r0=242(x), r1=88(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 88
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
