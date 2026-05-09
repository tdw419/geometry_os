; DESCRIPTION: Renders a blue disk with center (46, 30) and radius 23.
; PLAN: r0=46(x), r1=30(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 30
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
