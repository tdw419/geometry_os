; DESCRIPTION: Composite: Draws a orange circle centered at (165, 90) with radius 23 then Places a white dot at position (218, 165).
; PLAN: r0=165(x), r1=90(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=165(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 90
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 165
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
