; DESCRIPTION: Places a magenta disk with center (268, 21) and radius 26.
; PLAN: r0=268(x), r1=21(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 21
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
