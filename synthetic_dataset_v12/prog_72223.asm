; DESCRIPTION: Composite: Creates a white rectangular region at (383, 97) spanning 54 by 40 pixels then Sets a single cyan pixel at (0, 211).
; PLAN: r0=383(x), r1=97(y), r2=54(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=211(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 97
LDI r2, 54
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 211
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
