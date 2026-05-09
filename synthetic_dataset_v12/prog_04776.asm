; DESCRIPTION: Renders a magenta disk with center (92, 165) and radius 44.
; PLAN: r0=92(x), r1=165(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 165
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
