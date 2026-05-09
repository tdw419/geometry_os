; DESCRIPTION: Renders a blue disk with center (495, 198) and radius 14.
; PLAN: r0=495(x), r1=198(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 495
LDI r1, 198
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
