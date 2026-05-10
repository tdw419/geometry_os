; DESCRIPTION: Composite: Creates a white rectangular region at (248, 98) spanning 45 by 109 pixels then Sets a single cyan pixel at (214, 230).
; PLAN: r0=248(x), r1=98(y), r2=45(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=230(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 98
LDI r2, 45
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 230
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
