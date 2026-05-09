; DESCRIPTION: Creates a green circular shape at (153, 126) with radius 63.
; PLAN: r0=153(x), r1=126(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 126
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
