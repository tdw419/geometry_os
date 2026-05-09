; DESCRIPTION: Creates a green circular shape at (463, 143) with radius 21.
; PLAN: r0=463(x), r1=143(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 143
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
