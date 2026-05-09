; DESCRIPTION: Renders a magenta disk with center (293, 84) and radius 67.
; PLAN: r0=293(x), r1=84(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 84
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
