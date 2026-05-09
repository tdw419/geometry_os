; DESCRIPTION: Creates a blue circular shape at (77, 126) with radius 63.
; PLAN: r0=77(x), r1=126(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 126
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
