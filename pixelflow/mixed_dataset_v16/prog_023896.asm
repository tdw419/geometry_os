; DESCRIPTION: Composite: Creates a yellow rectangular region at (271, 118) spanning 44 by 69 pixels then Sets a single yellow pixel at (298, 62).
; PLAN: r0=271(x), r1=118(y), r2=44(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=62(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 118
LDI r2, 44
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 62
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
