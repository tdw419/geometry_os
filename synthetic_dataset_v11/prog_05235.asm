; DESCRIPTION: Places a yellow circle of radius 24 at center (190, 80).
; PLAN: r0=190(x), r1=80(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 80
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
