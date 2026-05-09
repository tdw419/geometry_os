; DESCRIPTION: Renders a magenta disk with center (125, 70) and radius 35.
; PLAN: r0=125(x), r1=70(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 70
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
