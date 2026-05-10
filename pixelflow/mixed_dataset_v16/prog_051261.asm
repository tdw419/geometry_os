; DESCRIPTION: Places a magenta circle of radius 65 at center (253, 179).
; PLAN: r0=253(x), r1=179(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 179
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
