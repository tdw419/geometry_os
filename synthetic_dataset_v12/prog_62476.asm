; DESCRIPTION: Creates a white circular shape at (96, 113) with radius 80.
; PLAN: r0=96(x), r1=113(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 113
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
