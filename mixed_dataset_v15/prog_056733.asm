; DESCRIPTION: Renders a magenta disk with center (293, 162) and radius 74.
; PLAN: r0=293(x), r1=162(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 162
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
