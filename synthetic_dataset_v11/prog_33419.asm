; DESCRIPTION: Composite: . Then Sets a single red pixel at (229, 100). Then Creates a red circular shape at (136, 158) with radius 72.
; PLAN: r0=229(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=136(x), r1=158(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (229, 100).
; PLAN: r0=229(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (136, 158) with radius 72.
; PLAN: r0=136(x), r1=158(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 158
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
