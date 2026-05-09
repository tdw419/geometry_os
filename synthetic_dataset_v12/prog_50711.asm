; DESCRIPTION: Composite: Draws a yellow circle centered at (158, 121) with radius 77 then Sets a single orange pixel at (258, 2).
; PLAN: r0=158(x), r1=121(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=2(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 121
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 2
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
