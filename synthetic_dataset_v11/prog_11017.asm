; DESCRIPTION: Composite: . Then Creates a white circular shape at (202, 131) with radius 49. Then Sets a single orange pixel at (13, 60).
; PLAN: r0=202(x), r1=131(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=13(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (202, 131) with radius 49.
; PLAN: r0=202(x), r1=131(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 131
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (13, 60).
; PLAN: r0=13(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 60
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
