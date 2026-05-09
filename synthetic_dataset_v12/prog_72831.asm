; DESCRIPTION: Composite: Creates a purple rectangular region at (162, 98) spanning 90 by 75 pixels then Sets a single black pixel at (407, 95).
; PLAN: r0=162(x), r1=98(y), r2=90(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=95(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 98
LDI r2, 90
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 95
LDI r7, 0x000000
PSET r5, r6, r7
HALT
