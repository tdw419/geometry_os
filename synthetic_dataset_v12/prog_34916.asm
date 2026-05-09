; DESCRIPTION: Creates a cyan circular shape at (378, 85) with radius 57.
; PLAN: r0=378(x), r1=85(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 85
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
