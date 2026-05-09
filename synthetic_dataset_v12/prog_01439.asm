; DESCRIPTION: Places a yellow circle of radius 13 at center (408, 149).
; PLAN: r0=408(x), r1=149(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 149
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
