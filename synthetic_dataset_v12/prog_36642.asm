; DESCRIPTION: Composite: Places a white dot at position (122, 228) then Creates a black rectangular region at (99, 72) spanning 44 by 56 pixels then Places a green circle of radius 15 at center (342, 183).
; PLAN: r0=122(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=72(y), r7=44(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=183(y), r12=15(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 72
LDI r7, 44
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 183
LDI r12, 15
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
