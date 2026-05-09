; DESCRIPTION: Places a yellow circle of radius 35 at center (131, 52).
; PLAN: r0=131(x), r1=52(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 52
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
