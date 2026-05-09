; DESCRIPTION: Composite: Creates a purple rectangular region at (391, 40) spanning 31 by 72 pixels then Sets a single green pixel at (367, 26).
; PLAN: r0=391(x), r1=40(y), r2=31(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=26(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 40
LDI r2, 31
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 26
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
