; DESCRIPTION: Composite: . Then Renders a orange disk with center (165, 174) and radius 42. Then Sets a single black pixel at (149, 104).
; PLAN: r0=165(x), r1=174(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=149(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (165, 174) and radius 42.
; PLAN: r0=165(x), r1=174(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 174
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (149, 104).
; PLAN: r0=149(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
HALT
