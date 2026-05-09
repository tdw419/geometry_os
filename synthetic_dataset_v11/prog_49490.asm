; DESCRIPTION: Renders a blue disk with center (66, 181) and radius 39.
; PLAN: r0=66(x), r1=181(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 181
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
