; DESCRIPTION: Composite: . Then Renders a black disk with center (92, 41) and radius 37. Then Places a black dot at position (66, 137).
; PLAN: r0=92(x), r1=41(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (92, 41) and radius 37.
; PLAN: r0=92(x), r1=41(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 41
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (66, 137).
; PLAN: r0=66(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
HALT
