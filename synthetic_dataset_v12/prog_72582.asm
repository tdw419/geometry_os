; DESCRIPTION: Renders a magenta disk with center (357, 96) and radius 59.
; PLAN: r0=357(x), r1=96(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 96
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
