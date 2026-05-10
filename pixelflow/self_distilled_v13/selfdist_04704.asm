; DESCRIPTION: Places a blue disk with center (336, 30) and radius 80.
; PLAN: r0=336(x), r1=30(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 30
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
