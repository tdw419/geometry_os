; DESCRIPTION: Composite: Creates a yellow rectangular region at (61, 11) spanning 64 by 12 pixels then Sets a single red pixel at (17, 119).
; PLAN: r0=61(x), r1=11(y), r2=64(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=119(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 11
LDI r2, 64
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 119
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
