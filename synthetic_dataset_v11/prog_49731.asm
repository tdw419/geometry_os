; DESCRIPTION: Places a yellow circle of radius 61 at center (94, 144).
; PLAN: r0=94(x), r1=144(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 144
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
