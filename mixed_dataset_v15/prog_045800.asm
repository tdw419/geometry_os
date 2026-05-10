; DESCRIPTION: Renders a yellow disk with center (349, 160) and radius 66.
; PLAN: r0=349(x), r1=160(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 160
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
