; DESCRIPTION: Places a yellow circle of radius 31 at center (229, 89).
; PLAN: r0=229(x), r1=89(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 89
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
