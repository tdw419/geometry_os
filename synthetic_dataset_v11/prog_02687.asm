; DESCRIPTION: Composite: . Then Sets a single white pixel at (108, 119). Then Places a black circle of radius 41 at center (103, 176).
; PLAN: r0=108(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=176(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (108, 119).
; PLAN: r0=108(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a black circle of radius 41 at center (103, 176).
; PLAN: r0=103(x), r1=176(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 176
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
