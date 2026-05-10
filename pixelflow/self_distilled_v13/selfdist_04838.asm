; DESCRIPTION: Places a magenta disk with center (382, 125) and radius 22.
; PLAN: r0=382(x), r1=125(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 125
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
