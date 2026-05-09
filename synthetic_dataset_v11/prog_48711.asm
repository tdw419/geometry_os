; DESCRIPTION: Places a yellow circle of radius 79 at center (94, 99).
; PLAN: r0=94(x), r1=99(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 99
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
