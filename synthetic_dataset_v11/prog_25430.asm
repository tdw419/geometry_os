; DESCRIPTION: Creates a white circular shape at (46, 200) with radius 33.
; PLAN: r0=46(x), r1=200(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 200
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
