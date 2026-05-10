; DESCRIPTION: Places a green disk with center (133, 24) and radius 10.
; PLAN: r0=133(x), r1=24(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 24
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
