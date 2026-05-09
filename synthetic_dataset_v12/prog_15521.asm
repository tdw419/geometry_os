; DESCRIPTION: Renders a magenta disk with center (315, 18) and radius 18.
; PLAN: r0=315(x), r1=18(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 18
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
