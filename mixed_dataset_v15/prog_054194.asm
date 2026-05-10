; DESCRIPTION: Places a yellow disk with center (24, 43) and radius 36.
; PLAN: r0=24(x), r1=43(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 43
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
