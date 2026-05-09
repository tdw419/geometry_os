; DESCRIPTION: Composite: Draws a cyan circle centered at (329, 79) with radius 48 then Sets a single red pixel at (283, 98).
; PLAN: r0=329(x), r1=79(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=98(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 79
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 98
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
