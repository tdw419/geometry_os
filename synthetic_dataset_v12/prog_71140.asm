; DESCRIPTION: Renders a yellow disk with center (258, 95) and radius 63.
; PLAN: r0=258(x), r1=95(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 95
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
