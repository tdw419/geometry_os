; DESCRIPTION: Renders a blue disk with center (426, 181) and radius 61.
; PLAN: r0=426(x), r1=181(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 181
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
