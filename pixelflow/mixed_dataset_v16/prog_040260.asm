; DESCRIPTION: Places a yellow disk with center (17, 200) and radius 59.
; PLAN: r0=17(x), r1=200(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 200
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
