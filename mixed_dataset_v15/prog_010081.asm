; DESCRIPTION: Renders a yellow disk with center (216, 37) and radius 19.
; PLAN: r0=216(x), r1=37(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 37
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
