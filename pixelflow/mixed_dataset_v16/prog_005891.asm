; DESCRIPTION: Places a blue disk with center (259, 178) and radius 37.
; PLAN: r0=259(x), r1=178(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 178
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
