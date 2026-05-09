; DESCRIPTION: Composite: Sets a single magenta pixel at (466, 103) then Creates a red circular shape at (257, 156) with radius 68.
; PLAN: r0=466(x), r1=103(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=156(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 466
LDI r1, 103
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 156
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
