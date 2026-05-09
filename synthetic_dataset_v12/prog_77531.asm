; DESCRIPTION: Renders a yellow disk with center (222, 117) and radius 47.
; PLAN: r0=222(x), r1=117(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 117
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
