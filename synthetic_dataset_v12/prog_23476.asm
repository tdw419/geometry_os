; DESCRIPTION: Places a yellow circle of radius 69 at center (345, 123).
; PLAN: r0=345(x), r1=123(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 123
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
