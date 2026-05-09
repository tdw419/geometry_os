; DESCRIPTION: Renders a magenta disk with center (226, 83) and radius 25.
; PLAN: r0=226(x), r1=83(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 83
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
