; DESCRIPTION: Composite: Creates a purple rectangular region at (308, 50) spanning 76 by 29 pixels then Sets a single black pixel at (4, 148).
; PLAN: r0=308(x), r1=50(y), r2=76(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x), r6=148(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 50
LDI r2, 76
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 148
LDI r7, 0x000000
PSET r5, r6, r7
HALT
