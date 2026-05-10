; DESCRIPTION: Renders a magenta disk with center (166, 112) and radius 59.
; PLAN: r0=166(x), r1=112(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 112
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
