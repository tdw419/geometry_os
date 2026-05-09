; DESCRIPTION: Composite: Creates a yellow rectangular region at (380, 178) spanning 98 by 71 pixels then Places a white dot at position (316, 149).
; PLAN: r0=380(x), r1=178(y), r2=98(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=149(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 178
LDI r2, 98
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 149
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
