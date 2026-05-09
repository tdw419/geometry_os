; DESCRIPTION: Composite: Places a blue circle of radius 41 at center (107, 213) then Sets a single red pixel at (44, 109).
; PLAN: r0=107(x), r1=213(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=109(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 213
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 109
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
