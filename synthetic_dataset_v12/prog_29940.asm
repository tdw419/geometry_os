; DESCRIPTION: Renders a magenta disk with center (217, 135) and radius 69.
; PLAN: r0=217(x), r1=135(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 135
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
