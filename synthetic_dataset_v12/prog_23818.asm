; DESCRIPTION: Renders a blue disk with center (340, 100) and radius 28.
; PLAN: r0=340(x), r1=100(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 100
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
