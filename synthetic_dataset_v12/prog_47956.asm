; DESCRIPTION: Renders a magenta disk with center (404, 145) and radius 66.
; PLAN: r0=404(x), r1=145(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 145
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
