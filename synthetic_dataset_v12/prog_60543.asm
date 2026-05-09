; DESCRIPTION: Composite: Creates a magenta rectangular region at (83, 31) spanning 105 by 118 pixels then Sets a single white pixel at (9, 16).
; PLAN: r0=83(x), r1=31(y), r2=105(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 31
LDI r2, 105
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
