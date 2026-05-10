; DESCRIPTION: Places a magenta disk with center (144, 57) and radius 23.
; PLAN: r0=144(x), r1=57(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 57
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
