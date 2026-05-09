; DESCRIPTION: Composite: Creates a cyan rectangular region at (255, 143) spanning 36 by 94 pixels then Sets a single green pixel at (378, 241).
; PLAN: r0=255(x), r1=143(y), r2=36(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=241(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 143
LDI r2, 36
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 241
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
