; DESCRIPTION: Places a yellow disk with center (311, 9) and radius 59.
; PLAN: r0=311(x), r1=9(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 9
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
