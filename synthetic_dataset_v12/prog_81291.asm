; DESCRIPTION: Composite: Renders a green box of size 83x15 starting at (347, 7) then Sets a single orange pixel at (172, 220).
; PLAN: r0=347(x), r1=7(y), r2=83(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=220(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 7
LDI r2, 83
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 220
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
