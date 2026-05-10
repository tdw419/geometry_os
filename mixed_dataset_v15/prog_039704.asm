; DESCRIPTION: Places a magenta disk with center (338, 97) and radius 12.
; PLAN: r0=338(x), r1=97(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 97
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
