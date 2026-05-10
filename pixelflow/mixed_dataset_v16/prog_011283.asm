; DESCRIPTION: Composite: Creates a orange rectangular region at (49, 171) spanning 47 by 26 pixels then Sets a single black pixel at (41, 82).
; PLAN: r0=49(x), r1=171(y), r2=47(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x), r6=82(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 49
LDI r1, 171
LDI r2, 47
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 82
LDI r7, 0x000000
PSET r5, r6, r7
HALT
