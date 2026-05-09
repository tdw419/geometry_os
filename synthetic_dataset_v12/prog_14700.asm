; DESCRIPTION: Composite: Creates a black rectangular region at (223, 138) spanning 103 by 70 pixels then Places a black dot at position (278, 78).
; PLAN: r0=223(x), r1=138(y), r2=103(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=78(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 138
LDI r2, 103
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 78
LDI r7, 0x000000
PSET r5, r6, r7
HALT
