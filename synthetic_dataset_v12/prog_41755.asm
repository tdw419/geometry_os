; DESCRIPTION: Renders a blue disk with center (373, 101) and radius 16.
; PLAN: r0=373(x), r1=101(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 101
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
