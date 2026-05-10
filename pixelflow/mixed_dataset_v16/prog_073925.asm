; DESCRIPTION: Places a blue disk with center (371, 48) and radius 50.
; PLAN: r0=371(x), r1=48(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 48
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
