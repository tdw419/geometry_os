; DESCRIPTION: Composite: . Then Renders a orange disk with center (41, 137) and radius 38. Then Sets a single purple pixel at (66, 29).
; PLAN: r0=41(x), r1=137(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (41, 137) and radius 38.
; PLAN: r0=41(x), r1=137(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 137
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (66, 29).
; PLAN: r0=66(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 29
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
