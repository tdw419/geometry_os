; DESCRIPTION: Composite: . Then Sets a single orange pixel at (52, 156). Then Renders a orange disk with center (66, 69) and radius 33.
; PLAN: r0=52(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=66(x), r1=69(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (52, 156).
; PLAN: r0=52(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 156
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (66, 69) and radius 33.
; PLAN: r0=66(x), r1=69(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 69
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
