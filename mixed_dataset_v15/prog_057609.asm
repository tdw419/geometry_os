; DESCRIPTION: Places a yellow circle of radius 13 at center (341, 150).
; PLAN: r0=341(x), r1=150(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 150
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
