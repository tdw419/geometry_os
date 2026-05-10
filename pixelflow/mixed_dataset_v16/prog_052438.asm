; DESCRIPTION: Renders a magenta disk with center (474, 216) and radius 23.
; PLAN: r0=474(x), r1=216(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 216
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
