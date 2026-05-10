; DESCRIPTION: Places a yellow circle of radius 70 at center (114, 149).
; PLAN: r0=114(x), r1=149(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 149
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
