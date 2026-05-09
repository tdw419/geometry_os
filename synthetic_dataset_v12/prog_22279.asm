; DESCRIPTION: Composite: Places a purple dot at position (364, 14) then Places a orange 109x82 rectangle at position (18, 169) then Creates a purple circular shape at (415, 203) with radius 29.
; PLAN: r0=364(x), r1=14(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=18(x), r6=169(y), r7=109(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=415(x), r11=203(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 14
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 18
LDI r6, 169
LDI r7, 109
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 203
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
