; DESCRIPTION: Renders a blue disk with center (382, 137) and radius 16.
; PLAN: r0=382(x), r1=137(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 137
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
