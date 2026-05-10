; DESCRIPTION: Composite: Creates a red rectangular region at (85, 98) spanning 17 by 71 pixels then Sets a single blue pixel at (289, 13).
; PLAN: r0=85(x), r1=98(y), r2=17(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=13(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 98
LDI r2, 17
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 13
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
