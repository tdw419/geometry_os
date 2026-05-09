; DESCRIPTION: Composite: . Then Creates a red circular shape at (131, 68) with radius 68. Then Sets a single blue pixel at (42, 203).
; PLAN: r0=131(x), r1=68(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=42(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (131, 68) with radius 68.
; PLAN: r0=131(x), r1=68(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 68
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (42, 203).
; PLAN: r0=42(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 203
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
