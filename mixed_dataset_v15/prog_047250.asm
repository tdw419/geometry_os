; DESCRIPTION: Places a yellow disk with center (37, 75) and radius 56.
; PLAN: r0=37(x), r1=75(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 75
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
