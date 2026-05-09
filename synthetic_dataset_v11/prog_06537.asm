; DESCRIPTION: Composite: . Then Places a purple dot at position (126, 108). Then Renders a purple disk with center (174, 184) and radius 41.
; PLAN: r0=126(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=174(x), r1=184(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (126, 108).
; PLAN: r0=126(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (174, 184) and radius 41.
; PLAN: r0=174(x), r1=184(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 184
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
