; DESCRIPTION: Places a yellow circle of radius 20 at center (151, 80).
; PLAN: r0=151(x), r1=80(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 80
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
