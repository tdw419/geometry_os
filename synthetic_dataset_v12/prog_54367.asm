; DESCRIPTION: Composite: Creates a blue rectangular region at (414, 221) spanning 15 by 13 pixels then Sets a single red pixel at (278, 170).
; PLAN: r0=414(x), r1=221(y), r2=15(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=170(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 221
LDI r2, 15
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 170
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
