; DESCRIPTION: Renders a magenta disk with center (417, 226) and radius 15.
; PLAN: r0=417(x), r1=226(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 226
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
