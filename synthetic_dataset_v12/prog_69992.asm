; DESCRIPTION: Renders a blue disk with center (278, 123) and radius 60.
; PLAN: r0=278(x), r1=123(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 123
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
