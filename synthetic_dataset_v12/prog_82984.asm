; DESCRIPTION: Places a yellow circle of radius 56 at center (154, 80).
; PLAN: r0=154(x), r1=80(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 80
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
