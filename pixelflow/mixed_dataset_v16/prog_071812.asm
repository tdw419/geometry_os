; DESCRIPTION: Places a yellow circle of radius 47 at center (371, 185).
; PLAN: r0=371(x), r1=185(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 185
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
