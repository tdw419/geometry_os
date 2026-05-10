; DESCRIPTION: Composite: Draws a orange circle centered at (180, 162) with radius 71 then Sets a single cyan pixel at (97, 90).
; PLAN: r0=180(x), r1=162(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=90(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 162
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 90
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
