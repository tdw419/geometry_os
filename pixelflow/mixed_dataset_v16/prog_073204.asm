; DESCRIPTION: Renders a magenta disk with center (216, 170) and radius 76.
; PLAN: r0=216(x), r1=170(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 170
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
