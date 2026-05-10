; DESCRIPTION: Renders a yellow disk with center (378, 68) and radius 63.
; PLAN: r0=378(x), r1=68(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 68
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
