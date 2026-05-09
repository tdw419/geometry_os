; DESCRIPTION: Renders a magenta disk with center (165, 70) and radius 11.
; PLAN: r0=165(x), r1=70(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 70
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
