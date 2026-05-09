; DESCRIPTION: Composite: Creates a red circular shape at (411, 87) with radius 13 then Sets a single red pixel at (68, 231).
; PLAN: r0=411(x), r1=87(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=231(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 87
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 231
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
