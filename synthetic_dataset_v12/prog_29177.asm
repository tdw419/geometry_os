; DESCRIPTION: Composite: Creates a yellow rectangular region at (317, 82) spanning 67 by 84 pixels then Sets a single black pixel at (303, 137).
; PLAN: r0=317(x), r1=82(y), r2=67(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=137(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 82
LDI r2, 67
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 137
LDI r7, 0x000000
PSET r5, r6, r7
HALT
