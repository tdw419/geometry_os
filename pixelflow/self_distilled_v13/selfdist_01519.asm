; DESCRIPTION: Places a magenta disk with center (253, 185) and radius 28.
; PLAN: r0=253(x), r1=185(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 185
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
