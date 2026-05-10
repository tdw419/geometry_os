; DESCRIPTION: Renders a magenta disk with center (223, 144) and radius 75.
; PLAN: r0=223(x), r1=144(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 144
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
