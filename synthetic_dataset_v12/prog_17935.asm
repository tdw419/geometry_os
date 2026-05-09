; DESCRIPTION: Creates a white circular shape at (199, 178) with radius 63.
; PLAN: r0=199(x), r1=178(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 178
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
