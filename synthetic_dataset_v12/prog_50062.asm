; DESCRIPTION: Composite: Creates a green rectangular region at (274, 8) spanning 63 by 93 pixels then Sets a single orange pixel at (174, 131).
; PLAN: r0=274(x), r1=8(y), r2=63(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=131(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 8
LDI r2, 63
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 131
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
