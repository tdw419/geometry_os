; DESCRIPTION: Renders a blue disk with center (151, 96) and radius 80.
; PLAN: r0=151(x), r1=96(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 96
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
