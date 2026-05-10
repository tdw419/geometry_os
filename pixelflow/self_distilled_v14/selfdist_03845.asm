; DESCRIPTION: Places a blue disk with center (356, 130) and radius 32.
; PLAN: r0=356(x), r1=130(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 130
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
