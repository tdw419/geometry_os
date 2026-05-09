; DESCRIPTION: Creates a blue circular shape at (195, 117) with radius 44.
; PLAN: r0=195(x), r1=117(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 117
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
