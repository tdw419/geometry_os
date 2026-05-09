; DESCRIPTION: Composite: Places a orange dot at position (49, 227) then Renders a red disk with center (94, 172) and radius 37.
; PLAN: r0=49(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=172(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 94
LDI r6, 172
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
