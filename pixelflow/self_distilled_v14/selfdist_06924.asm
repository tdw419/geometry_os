; DESCRIPTION: Places a yellow disk with center (28, 145) and radius 10.
; PLAN: r0=28(x), r1=145(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 145
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
