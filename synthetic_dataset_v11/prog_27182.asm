; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (201, 57). Then Creates a red circular shape at (171, 154) with radius 63.
; PLAN: r0=201(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=171(x), r1=154(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (201, 57).
; PLAN: r0=201(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (171, 154) with radius 63.
; PLAN: r0=171(x), r1=154(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 154
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
