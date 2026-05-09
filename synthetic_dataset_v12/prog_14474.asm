; DESCRIPTION: Composite: Creates a blue rectangular region at (153, 135) spanning 57 by 97 pixels then Sets a single black pixel at (290, 38).
; PLAN: r0=153(x), r1=135(y), r2=57(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=38(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 135
LDI r2, 57
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 38
LDI r7, 0x000000
PSET r5, r6, r7
HALT
