; DESCRIPTION: Renders a magenta disk with center (165, 55) and radius 45.
; PLAN: r0=165(x), r1=55(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 55
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
