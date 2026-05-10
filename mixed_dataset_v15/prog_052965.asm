; DESCRIPTION: Composite: Places a purple dot at position (331, 58) then Renders a black disk with center (41, 145) and radius 22.
; PLAN: r0=331(x), r1=58(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=145(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 331
LDI r1, 58
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 145
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
