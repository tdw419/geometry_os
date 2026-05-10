; DESCRIPTION: Places a yellow disk with center (227, 69) and radius 48.
; PLAN: r0=227(x), r1=69(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 69
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
