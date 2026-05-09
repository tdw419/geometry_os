; DESCRIPTION: Places a yellow circle of radius 31 at center (331, 127).
; PLAN: r0=331(x), r1=127(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 127
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
