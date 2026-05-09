; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (53, 120) with radius 28. Then Sets a single orange pixel at (35, 60).
; PLAN: r0=53(x), r1=120(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=35(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (53, 120) with radius 28.
; PLAN: r0=53(x), r1=120(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 120
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (35, 60).
; PLAN: r0=35(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 60
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
