; DESCRIPTION: Places a yellow circle of radius 66 at center (251, 170).
; PLAN: r0=251(x), r1=170(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 170
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
