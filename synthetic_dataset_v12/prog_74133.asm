; DESCRIPTION: Composite: Creates a yellow rectangular region at (319, 157) spanning 101 by 43 pixels then Sets a single orange pixel at (101, 231).
; PLAN: r0=319(x), r1=157(y), r2=101(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=231(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 157
LDI r2, 101
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 231
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
