; DESCRIPTION: Places a yellow circle of radius 24 at center (470, 78).
; PLAN: r0=470(x), r1=78(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 78
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
