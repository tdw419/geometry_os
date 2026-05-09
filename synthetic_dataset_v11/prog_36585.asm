; DESCRIPTION: Renders a magenta disk with center (145, 54) and radius 13.
; PLAN: r0=145(x), r1=54(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 54
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
