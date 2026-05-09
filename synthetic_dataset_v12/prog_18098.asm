; DESCRIPTION: Renders a magenta disk with center (210, 81) and radius 21.
; PLAN: r0=210(x), r1=81(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 81
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
