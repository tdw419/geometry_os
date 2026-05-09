; DESCRIPTION: Composite: Creates a white rectangular region at (186, 219) spanning 72 by 17 pixels then Sets a single white pixel at (455, 90).
; PLAN: r0=186(x), r1=219(y), r2=72(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=90(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 219
LDI r2, 72
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 90
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
