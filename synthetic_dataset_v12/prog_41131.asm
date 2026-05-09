; DESCRIPTION: Composite: Creates a orange rectangular region at (405, 207) spanning 15 by 35 pixels then Sets a single yellow pixel at (86, 207).
; PLAN: r0=405(x), r1=207(y), r2=15(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=207(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 207
LDI r2, 15
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 207
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
