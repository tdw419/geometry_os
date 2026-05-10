; DESCRIPTION: Composite: Creates a black rectangular region at (308, 139) spanning 100 by 18 pixels then Places a black dot at position (93, 147) then Places a magenta circle of radius 45 at center (342, 121).
; PLAN: r0=308(x), r1=139(y), r2=100(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=147(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=121(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 139
LDI r2, 100
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 147
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 342
LDI r11, 121
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
