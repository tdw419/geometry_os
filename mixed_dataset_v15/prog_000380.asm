; DESCRIPTION: Composite: Places a white dot at position (24, 208) then Creates a purple rectangular region at (137, 102) spanning 81 by 85 pixels then Creates a white circular shape at (351, 208) with radius 39.
; PLAN: r0=24(x), r1=208(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=102(y), r7=81(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x), r11=208(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 208
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 102
LDI r7, 81
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 208
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
