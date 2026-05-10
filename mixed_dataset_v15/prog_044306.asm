; DESCRIPTION: Places a yellow disk with center (88, 150) and radius 15.
; PLAN: r0=88(x), r1=150(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 150
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
