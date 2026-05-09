; DESCRIPTION: Composite: Creates a yellow rectangular region at (311, 236) spanning 90 by 11 pixels then Sets a single yellow pixel at (149, 68).
; PLAN: r0=311(x), r1=236(y), r2=90(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=68(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 236
LDI r2, 90
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 68
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
