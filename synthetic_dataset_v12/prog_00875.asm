; DESCRIPTION: Composite: Creates a orange circular shape at (139, 102) with radius 59 then Sets a single red pixel at (286, 207).
; PLAN: r0=139(x), r1=102(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=207(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 102
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 207
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
