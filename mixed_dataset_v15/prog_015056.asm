; DESCRIPTION: Composite: Creates a green rectangular region at (244, 33) spanning 92 by 108 pixels then Sets a single black pixel at (399, 199).
; PLAN: r0=244(x), r1=33(y), r2=92(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 33
LDI r2, 92
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
HALT
