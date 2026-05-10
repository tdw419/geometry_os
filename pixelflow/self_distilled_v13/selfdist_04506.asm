; DESCRIPTION: Places a yellow disk with center (326, 106) and radius 15.
; PLAN: r0=326(x), r1=106(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 106
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
