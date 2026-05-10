; DESCRIPTION: Composite: Draws a purple circle centered at (357, 123) with radius 47 then Sets a single cyan pixel at (41, 208).
; PLAN: r0=357(x), r1=123(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=208(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 123
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 208
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
