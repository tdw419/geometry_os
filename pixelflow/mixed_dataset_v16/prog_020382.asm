; DESCRIPTION: Creates a magenta circular shape at (445, 201) with radius 18.
; PLAN: r0=445(x), r1=201(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 201
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
