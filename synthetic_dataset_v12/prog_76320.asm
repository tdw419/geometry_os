; DESCRIPTION: Composite: Creates a magenta rectangular region at (283, 61) spanning 100 by 42 pixels then Sets a single black pixel at (31, 184).
; PLAN: r0=283(x), r1=61(y), r2=100(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x), r6=184(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 61
LDI r2, 100
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 184
LDI r7, 0x000000
PSET r5, r6, r7
HALT
