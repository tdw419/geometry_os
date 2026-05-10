; DESCRIPTION: Composite: Creates a black rectangular region at (248, 153) spanning 119 by 94 pixels then Sets a single black pixel at (53, 87).
; PLAN: r0=248(x), r1=153(y), r2=119(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=87(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 153
LDI r2, 119
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 87
LDI r7, 0x000000
PSET r5, r6, r7
HALT
