; DESCRIPTION: Places a magenta disk with center (245, 179) and radius 65.
; PLAN: r0=245(x), r1=179(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 179
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
