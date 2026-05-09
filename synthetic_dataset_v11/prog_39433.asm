; DESCRIPTION: Creates a white circular shape at (96, 108) with radius 66.
; PLAN: r0=96(x), r1=108(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 108
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
