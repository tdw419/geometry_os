; DESCRIPTION: Places a yellow disk with center (237, 169) and radius 60.
; PLAN: r0=237(x), r1=169(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 169
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
