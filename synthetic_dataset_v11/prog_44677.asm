; DESCRIPTION: Places a yellow circle of radius 62 at center (69, 148).
; PLAN: r0=69(x), r1=148(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 148
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
