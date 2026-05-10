; DESCRIPTION: Composite: Places a purple dot at position (12, 143) then Places a white 62x92 rectangle at position (31, 0) then Draws a red circle centered at (201, 41) with radius 15.
; PLAN: r0=12(x), r1=143(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=0(y), r7=62(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=41(y), r12=15(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 12
LDI r1, 143
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 31
LDI r6, 0
LDI r7, 62
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 41
LDI r12, 15
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
