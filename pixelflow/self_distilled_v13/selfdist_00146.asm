; DESCRIPTION: Places a blue disk with center (271, 22) and radius 40.
; PLAN: r0=271(x), r1=22(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 22
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
