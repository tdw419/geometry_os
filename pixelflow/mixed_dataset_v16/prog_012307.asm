; DESCRIPTION: Renders a magenta disk with center (441, 75) and radius 64.
; PLAN: r0=441(x), r1=75(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 75
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
