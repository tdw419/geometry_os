; DESCRIPTION: Composite: Creates a white rectangular region at (94, 15) spanning 39 by 101 pixels then Sets a single black pixel at (264, 12).
; PLAN: r0=94(x), r1=15(y), r2=39(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x), r6=12(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 15
LDI r2, 39
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 12
LDI r7, 0x000000
PSET r5, r6, r7
HALT
