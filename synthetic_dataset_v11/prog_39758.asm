; DESCRIPTION: Composite: . Then Places a orange dot at position (114, 216). Then Renders a green disk with center (38, 41) and radius 12.
; PLAN: r0=114(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=38(x), r1=41(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (114, 216).
; PLAN: r0=114(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a green disk with center (38, 41) and radius 12.
; PLAN: r0=38(x), r1=41(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 41
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
