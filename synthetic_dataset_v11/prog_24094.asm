; DESCRIPTION: Renders a magenta disk with center (76, 68) and radius 26.
; PLAN: r0=76(x), r1=68(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 68
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
