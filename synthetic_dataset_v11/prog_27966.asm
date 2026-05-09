; DESCRIPTION: Creates a yellow circular shape at (185, 169) with radius 62.
; PLAN: r0=185(x), r1=169(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 169
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
