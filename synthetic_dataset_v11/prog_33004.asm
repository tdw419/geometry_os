; DESCRIPTION: Composite: . Then Sets a single orange pixel at (56, 160). Then Creates a white circular shape at (156, 118) with radius 56.
; PLAN: r0=56(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=156(x), r1=118(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (56, 160).
; PLAN: r0=56(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (156, 118) with radius 56.
; PLAN: r0=156(x), r1=118(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 118
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
