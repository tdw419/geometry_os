; DESCRIPTION: Renders a magenta disk with center (14, 17) and radius 10.
; PLAN: r0=14(x), r1=17(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 17
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
