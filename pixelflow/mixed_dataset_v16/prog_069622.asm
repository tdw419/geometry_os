; DESCRIPTION: Places a blue disk with center (7, 199) and radius 10.
; PLAN: r0=7(x), r1=199(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 7
LDI r1, 199
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
