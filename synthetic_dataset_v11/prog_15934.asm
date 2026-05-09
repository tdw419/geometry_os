; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (42, 97). Then Creates a cyan circular shape at (140, 131) with radius 55.
; PLAN: r0=42(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=140(x), r1=131(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (42, 97).
; PLAN: r0=42(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 97
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (140, 131) with radius 55.
; PLAN: r0=140(x), r1=131(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 131
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
