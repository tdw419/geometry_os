; DESCRIPTION: Renders a magenta disk with center (249, 62) and radius 14.
; PLAN: r0=249(x), r1=62(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 62
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
