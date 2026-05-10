; DESCRIPTION: Composite: Creates a yellow rectangular region at (155, 117) spanning 10 by 91 pixels then Sets a single black pixel at (149, 73).
; PLAN: r0=155(x), r1=117(y), r2=10(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=73(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 117
LDI r2, 10
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 73
LDI r7, 0x000000
PSET r5, r6, r7
HALT
