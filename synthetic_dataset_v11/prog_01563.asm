; DESCRIPTION: Renders a magenta disk with center (80, 122) and radius 21.
; PLAN: r0=80(x), r1=122(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 122
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
