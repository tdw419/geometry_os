; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (237, 0). Then Creates a green circular shape at (42, 100) with radius 42.
; PLAN: r0=237(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=42(x), r1=100(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (237, 0).
; PLAN: r0=237(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 0
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (42, 100) with radius 42.
; PLAN: r0=42(x), r1=100(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 100
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
