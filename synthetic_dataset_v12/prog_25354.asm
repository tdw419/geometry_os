; DESCRIPTION: Places a green circle of radius 37 at center (312, 37).
; PLAN: r0=312(x), r1=37(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 37
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
