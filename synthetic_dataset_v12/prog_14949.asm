; DESCRIPTION: Renders a blue disk with center (333, 48) and radius 37.
; PLAN: r0=333(x), r1=48(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 48
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
