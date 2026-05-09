; DESCRIPTION: Creates a green circular shape at (268, 143) with radius 57.
; PLAN: r0=268(x), r1=143(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 143
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
