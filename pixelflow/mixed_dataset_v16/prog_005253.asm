; DESCRIPTION: Renders a yellow disk with center (264, 176) and radius 70.
; PLAN: r0=264(x), r1=176(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 176
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
