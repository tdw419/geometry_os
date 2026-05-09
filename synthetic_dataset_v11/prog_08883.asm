; DESCRIPTION: Creates a white circular shape at (125, 205) with radius 33.
; PLAN: r0=125(x), r1=205(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 205
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
