; DESCRIPTION: Composite: Places a green circle of radius 70 at center (158, 70) then Places a black dot at position (497, 77).
; PLAN: r0=158(x), r1=70(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x), r6=77(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 70
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 77
LDI r7, 0x000000
PSET r5, r6, r7
HALT
