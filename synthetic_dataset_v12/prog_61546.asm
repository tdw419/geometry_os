; DESCRIPTION: Composite: Draws a white circle centered at (107, 120) with radius 14 then Sets a single cyan pixel at (316, 176).
; PLAN: r0=107(x), r1=120(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=176(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 120
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 176
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
