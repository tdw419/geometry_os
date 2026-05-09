; DESCRIPTION: Renders a magenta disk with center (148, 156) and radius 46.
; PLAN: r0=148(x), r1=156(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 156
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
