; DESCRIPTION: Creates a cyan circular shape at (83, 111) with radius 23.
; PLAN: r0=83(x), r1=111(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 111
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
