; DESCRIPTION: Renders a blue disk with center (402, 168) and radius 23.
; PLAN: r0=402(x), r1=168(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 168
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
