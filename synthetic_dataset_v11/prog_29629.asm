; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (8, 247). Then Creates a yellow circular shape at (73, 177) with radius 24.
; PLAN: r0=8(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=73(x), r1=177(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (8, 247).
; PLAN: r0=8(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 247
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (73, 177) with radius 24.
; PLAN: r0=73(x), r1=177(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 177
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
