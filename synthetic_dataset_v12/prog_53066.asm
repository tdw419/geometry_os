; DESCRIPTION: Creates a white circular shape at (28, 84) with radius 20.
; PLAN: r0=28(x), r1=84(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 84
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
