; DESCRIPTION: Renders a magenta disk with center (145, 152) and radius 75.
; PLAN: r0=145(x), r1=152(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 152
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
