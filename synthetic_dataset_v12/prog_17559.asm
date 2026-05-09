; DESCRIPTION: Composite: Creates a yellow rectangular region at (134, 203) spanning 28 by 41 pixels then Sets a single orange pixel at (401, 98).
; PLAN: r0=134(x), r1=203(y), r2=28(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=98(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 203
LDI r2, 28
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 98
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
