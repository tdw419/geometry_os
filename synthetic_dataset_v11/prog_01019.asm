; DESCRIPTION: Creates a white circular shape at (126, 91) with radius 33.
; PLAN: r0=126(x), r1=91(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 91
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
