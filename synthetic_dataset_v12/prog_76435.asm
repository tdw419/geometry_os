; DESCRIPTION: Places a yellow circle of radius 80 at center (165, 131).
; PLAN: r0=165(x), r1=131(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 131
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
