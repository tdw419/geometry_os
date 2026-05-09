; DESCRIPTION: Places a yellow circle of radius 14 at center (52, 90).
; PLAN: r0=52(x), r1=90(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 90
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
