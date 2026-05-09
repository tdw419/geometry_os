; DESCRIPTION: Composite: Creates a blue circular shape at (122, 134) with radius 77 then Sets a single cyan pixel at (132, 145).
; PLAN: r0=122(x), r1=134(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=145(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 134
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 145
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
