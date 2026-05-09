; DESCRIPTION: Creates a white circular shape at (260, 79) with radius 30.
; PLAN: r0=260(x), r1=79(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 79
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
