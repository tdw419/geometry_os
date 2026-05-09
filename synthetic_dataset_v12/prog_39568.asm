; DESCRIPTION: Creates a blue circular shape at (309, 159) with radius 21.
; PLAN: r0=309(x), r1=159(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 159
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
