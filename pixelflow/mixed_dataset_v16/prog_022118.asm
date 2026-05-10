; DESCRIPTION: Composite: Draws a red circle centered at (244, 124) with radius 79 then Places a orange dot at position (429, 142).
; PLAN: r0=244(x), r1=124(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=142(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 124
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 142
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
