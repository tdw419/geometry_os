; DESCRIPTION: Creates a white circular shape at (465, 110) with radius 33.
; PLAN: r0=465(x), r1=110(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 110
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
