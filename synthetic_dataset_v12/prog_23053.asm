; DESCRIPTION: Renders a blue disk with center (45, 80) and radius 38.
; PLAN: r0=45(x), r1=80(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 80
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
