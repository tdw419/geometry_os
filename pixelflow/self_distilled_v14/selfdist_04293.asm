; DESCRIPTION: Renders a yellow circular shape at (105, 169) with radius 70.
; PLAN: r0=105(x), r1=169(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 169
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
