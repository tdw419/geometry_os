; DESCRIPTION: Renders a magenta disk with center (407, 144) and radius 74.
; PLAN: r0=407(x), r1=144(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 144
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
