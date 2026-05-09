; DESCRIPTION: Places a yellow circle of radius 75 at center (99, 172).
; PLAN: r0=99(x), r1=172(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 172
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
