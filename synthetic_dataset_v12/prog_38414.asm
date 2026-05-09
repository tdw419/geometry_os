; DESCRIPTION: Renders a blue disk with center (92, 193) and radius 14.
; PLAN: r0=92(x), r1=193(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 193
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
