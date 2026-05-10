; DESCRIPTION: Composite: Creates a cyan rectangular region at (153, 70) spanning 96 by 11 pixels then Sets a single black pixel at (322, 144).
; PLAN: r0=153(x), r1=70(y), r2=96(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=144(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 70
LDI r2, 96
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 144
LDI r7, 0x000000
PSET r5, r6, r7
HALT
