; DESCRIPTION: Renders a magenta disk with center (282, 132) and radius 47.
; PLAN: r0=282(x), r1=132(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 132
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
