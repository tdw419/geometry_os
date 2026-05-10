; DESCRIPTION: Places a yellow disk with center (124, 124) and radius 44.
; PLAN: r0=124(x), r1=124(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 124
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
