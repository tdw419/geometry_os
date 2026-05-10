; DESCRIPTION: Places a yellow circle of radius 46 at center (334, 207).
; PLAN: r0=334(x), r1=207(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 207
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
