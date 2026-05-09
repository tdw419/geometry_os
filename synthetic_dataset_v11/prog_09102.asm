; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (34, 61). Then Creates a cyan circular shape at (144, 39) with radius 31.
; PLAN: r0=34(x), r1=61(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=144(x), r1=39(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (34, 61).
; PLAN: r0=34(x), r1=61(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 61
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (144, 39) with radius 31.
; PLAN: r0=144(x), r1=39(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 39
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
