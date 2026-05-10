; DESCRIPTION: Renders a yellow disk with center (149, 181) and radius 36.
; PLAN: r0=149(x), r1=181(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 181
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
