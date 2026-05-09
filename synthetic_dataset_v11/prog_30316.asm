; DESCRIPTION: Composite: . Then Creates a red circular shape at (93, 166) with radius 72. Then Sets a single magenta pixel at (85, 157).
; PLAN: r0=93(x), r1=166(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=85(x), r1=157(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (93, 166) with radius 72.
; PLAN: r0=93(x), r1=166(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 166
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (85, 157).
; PLAN: r0=85(x), r1=157(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 157
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
