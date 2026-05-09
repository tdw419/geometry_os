; DESCRIPTION: Composite: . Then Places a orange dot at position (246, 129). Then Places a white circle of radius 27 at center (93, 176).
; PLAN: r0=246(x), r1=129(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=93(x), r1=176(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (246, 129).
; PLAN: r0=246(x), r1=129(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 129
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 27 at center (93, 176).
; PLAN: r0=93(x), r1=176(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 176
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
