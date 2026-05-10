; DESCRIPTION: Places a blue disk with center (208, 101) and radius 30.
; PLAN: r0=208(x), r1=101(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 101
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
