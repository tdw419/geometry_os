; DESCRIPTION: Creates a magenta circular shape at (56, 91) with radius 35.
; PLAN: r0=56(x), r1=91(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 91
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
