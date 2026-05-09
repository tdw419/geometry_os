; DESCRIPTION: Creates a white circular shape at (288, 79) with radius 66.
; PLAN: r0=288(x), r1=79(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 79
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
