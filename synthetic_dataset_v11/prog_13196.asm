; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (179, 94) with radius 72. Then Sets a single yellow pixel at (246, 94).
; PLAN: r0=179(x), r1=94(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=246(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan circular shape at (179, 94) with radius 72.
; PLAN: r0=179(x), r1=94(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 94
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (246, 94).
; PLAN: r0=246(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
