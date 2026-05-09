; DESCRIPTION: Creates a green circular shape at (70, 124) with radius 39.
; PLAN: r0=70(x), r1=124(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 124
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
