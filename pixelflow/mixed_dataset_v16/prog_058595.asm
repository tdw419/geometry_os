; DESCRIPTION: Composite: Creates a white rectangular region at (8, 27) spanning 66 by 43 pixels then Sets a single cyan pixel at (478, 175).
; PLAN: r0=8(x), r1=27(y), r2=66(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=175(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 27
LDI r2, 66
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 175
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
