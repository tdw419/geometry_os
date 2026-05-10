; DESCRIPTION: Composite: Creates a yellow rectangular region at (386, 167) spanning 69 by 13 pixels then Sets a single green pixel at (251, 42).
; PLAN: r0=386(x), r1=167(y), r2=69(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x), r6=42(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 167
LDI r2, 69
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 42
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
