; DESCRIPTION: Renders a yellow disk with center (91, 149) and radius 58.
; PLAN: r0=91(x), r1=149(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 149
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
