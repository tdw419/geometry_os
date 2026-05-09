; DESCRIPTION: Composite: Places a orange circle of radius 33 at center (408, 133) then Sets a single white pixel at (330, 11).
; PLAN: r0=408(x), r1=133(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=11(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 133
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 11
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
