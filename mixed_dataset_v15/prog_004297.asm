; DESCRIPTION: Renders a yellow circular shape at (216, 184) with radius 56.
; PLAN: r0=216(x), r1=184(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 184
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
