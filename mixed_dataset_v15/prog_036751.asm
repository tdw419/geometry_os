; DESCRIPTION: Composite: Places a red dot at position (461, 170) then Renders a white disk with center (461, 132) and radius 26.
; PLAN: r0=461(x), r1=170(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=132(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 461
LDI r1, 170
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 461
LDI r6, 132
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
