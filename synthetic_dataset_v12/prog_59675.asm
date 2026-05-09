; DESCRIPTION: Renders a magenta disk with center (219, 162) and radius 69.
; PLAN: r0=219(x), r1=162(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 162
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
