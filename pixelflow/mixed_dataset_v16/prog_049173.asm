; DESCRIPTION: Creates a white circular shape at (302, 87) with radius 12.
; PLAN: r0=302(x), r1=87(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 87
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
