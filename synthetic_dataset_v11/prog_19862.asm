; DESCRIPTION: Renders a magenta disk with center (161, 139) and radius 24.
; PLAN: r0=161(x), r1=139(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 139
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
