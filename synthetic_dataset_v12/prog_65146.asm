; DESCRIPTION: Composite: Places a orange dot at position (483, 103) then Draws a white circle centered at (321, 193) with radius 27.
; PLAN: r0=483(x), r1=103(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=193(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 103
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 321
LDI r6, 193
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
