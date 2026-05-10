; DESCRIPTION: Places a yellow circle of radius 54 at center (191, 139).
; PLAN: r0=191(x), r1=139(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 139
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
