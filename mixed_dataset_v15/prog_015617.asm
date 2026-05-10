; DESCRIPTION: Composite: Creates a white rectangular region at (410, 60) spanning 94 by 26 pixels then Sets a single yellow pixel at (302, 34).
; PLAN: r0=410(x), r1=60(y), r2=94(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=34(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 60
LDI r2, 94
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 34
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
