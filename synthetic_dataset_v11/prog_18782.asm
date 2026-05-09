; DESCRIPTION: Renders a magenta disk with center (110, 171) and radius 17.
; PLAN: r0=110(x), r1=171(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 171
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
