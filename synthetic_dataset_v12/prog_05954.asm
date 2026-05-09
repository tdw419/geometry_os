; DESCRIPTION: Renders a magenta disk with center (149, 109) and radius 76.
; PLAN: r0=149(x), r1=109(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 109
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
