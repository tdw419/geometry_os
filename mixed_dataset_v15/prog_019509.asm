; DESCRIPTION: Composite: Creates a green rectangular region at (314, 51) spanning 118 by 96 pixels then Sets a single white pixel at (432, 208).
; PLAN: r0=314(x), r1=51(y), r2=118(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=208(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 51
LDI r2, 118
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 208
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
