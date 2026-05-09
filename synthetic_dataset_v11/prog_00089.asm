; DESCRIPTION: Composite: . Then Sets a single green pixel at (71, 173). Then Creates a orange circular shape at (156, 127) with radius 79.
; PLAN: r0=71(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=156(x), r1=127(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (71, 173).
; PLAN: r0=71(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 173
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a orange circular shape at (156, 127) with radius 79.
; PLAN: r0=156(x), r1=127(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 127
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
