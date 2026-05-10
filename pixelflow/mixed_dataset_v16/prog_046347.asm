; DESCRIPTION: Composite: Creates a black rectangular region at (24, 17) spanning 74 by 54 pixels then Sets a single green pixel at (371, 89).
; PLAN: r0=24(x), r1=17(y), r2=74(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=89(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 24
LDI r1, 17
LDI r2, 74
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 89
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
