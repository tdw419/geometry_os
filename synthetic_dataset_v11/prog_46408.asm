; DESCRIPTION: Renders a magenta disk with center (86, 40) and radius 26.
; PLAN: r0=86(x), r1=40(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 40
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
