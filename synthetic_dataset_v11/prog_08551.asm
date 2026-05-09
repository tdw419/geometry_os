; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (184, 90). Then Creates a red circular shape at (229, 79) with radius 19.
; PLAN: r0=184(x), r1=90(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=229(x), r1=79(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (184, 90).
; PLAN: r0=184(x), r1=90(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 90
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (229, 79) with radius 19.
; PLAN: r0=229(x), r1=79(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 79
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
