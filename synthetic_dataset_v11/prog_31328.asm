; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (109, 136). Then Creates a cyan circular shape at (103, 128) with radius 39.
; PLAN: r0=109(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=128(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (109, 136).
; PLAN: r0=109(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 136
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (103, 128) with radius 39.
; PLAN: r0=103(x), r1=128(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 128
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
