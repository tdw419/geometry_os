; DESCRIPTION: Renders a magenta disk with center (145, 97) and radius 67.
; PLAN: r0=145(x), r1=97(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 97
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
