; DESCRIPTION: Places a magenta disk with center (6, 86) and radius 26.
; PLAN: r0=6(x), r1=86(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 6
LDI r1, 86
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
