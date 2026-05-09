; DESCRIPTION: Renders a blue disk with center (356, 59) and radius 56.
; PLAN: r0=356(x), r1=59(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 59
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
