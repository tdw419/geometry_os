; DESCRIPTION: Renders a magenta disk with center (264, 141) and radius 17.
; PLAN: r0=264(x), r1=141(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 141
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
