; DESCRIPTION: Places a yellow disk with center (80, 145) and radius 16.
; PLAN: r0=80(x), r1=145(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 145
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
