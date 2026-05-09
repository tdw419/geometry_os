; DESCRIPTION: Renders a yellow disk with center (45, 149) and radius 37.
; PLAN: r0=45(x), r1=149(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 149
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
