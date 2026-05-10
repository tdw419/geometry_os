; DESCRIPTION: Renders a yellow disk with center (409, 149) and radius 69.
; PLAN: r0=409(x), r1=149(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 149
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
