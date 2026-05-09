; DESCRIPTION: Renders a magenta disk with center (62, 95) and radius 43.
; PLAN: r0=62(x), r1=95(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 95
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
