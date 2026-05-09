; DESCRIPTION: Renders a magenta disk with center (225, 158) and radius 46.
; PLAN: r0=225(x), r1=158(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 158
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
