; DESCRIPTION: Renders a blue disk with center (160, 153) and radius 72.
; PLAN: r0=160(x), r1=153(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 153
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
