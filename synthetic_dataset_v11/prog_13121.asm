; DESCRIPTION: Renders a magenta disk with center (61, 55) and radius 18.
; PLAN: r0=61(x), r1=55(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 55
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
