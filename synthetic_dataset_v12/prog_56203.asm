; DESCRIPTION: Creates a white circular shape at (288, 149) with radius 31.
; PLAN: r0=288(x), r1=149(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 149
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
