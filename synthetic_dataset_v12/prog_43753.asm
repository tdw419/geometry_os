; DESCRIPTION: Composite: Creates a black rectangular region at (438, 166) spanning 36 by 74 pixels then Sets a single green pixel at (154, 167).
; PLAN: r0=438(x), r1=166(y), r2=36(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=167(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 438
LDI r1, 166
LDI r2, 36
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 167
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
