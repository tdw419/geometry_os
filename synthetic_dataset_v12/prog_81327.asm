; DESCRIPTION: Composite: Creates a yellow rectangular region at (145, 5) spanning 58 by 98 pixels then Places a yellow dot at position (53, 17).
; PLAN: r0=145(x), r1=5(y), r2=58(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=17(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 5
LDI r2, 58
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 17
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
