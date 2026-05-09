; DESCRIPTION: Composite: Creates a white rectangular region at (107, 150) spanning 11 by 90 pixels then Sets a single yellow pixel at (385, 51).
; PLAN: r0=107(x), r1=150(y), r2=11(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=51(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 150
LDI r2, 11
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 51
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
