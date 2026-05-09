; DESCRIPTION: Creates a green circular shape at (279, 143) with radius 43.
; PLAN: r0=279(x), r1=143(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 143
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
