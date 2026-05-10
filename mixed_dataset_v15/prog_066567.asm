; DESCRIPTION: Renders a blue disk with center (459, 171) and radius 46.
; PLAN: r0=459(x), r1=171(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 171
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
