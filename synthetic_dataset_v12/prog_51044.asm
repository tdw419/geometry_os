; DESCRIPTION: Creates a green circular shape at (276, 108) with radius 64.
; PLAN: r0=276(x), r1=108(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 108
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
