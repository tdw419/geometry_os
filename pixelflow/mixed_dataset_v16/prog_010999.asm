; DESCRIPTION: Renders a yellow disk with center (55, 229) and radius 21.
; PLAN: r0=55(x), r1=229(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 229
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
