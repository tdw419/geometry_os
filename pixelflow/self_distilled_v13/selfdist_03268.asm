; DESCRIPTION: Places a yellow disk with center (147, 69) and radius 46.
; PLAN: r0=147(x), r1=69(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 69
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
