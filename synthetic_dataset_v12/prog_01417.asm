; DESCRIPTION: Creates a red circular shape at (44, 98) with radius 31.
; PLAN: r0=44(x), r1=98(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 98
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
