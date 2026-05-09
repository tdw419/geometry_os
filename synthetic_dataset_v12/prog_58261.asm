; DESCRIPTION: Composite: Creates a cyan rectangular region at (131, 58) spanning 66 by 77 pixels then Sets a single green pixel at (40, 72).
; PLAN: r0=131(x), r1=58(y), r2=66(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=72(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 58
LDI r2, 66
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 72
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
