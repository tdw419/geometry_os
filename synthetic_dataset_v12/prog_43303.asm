; DESCRIPTION: Composite: Creates a white rectangular region at (205, 235) spanning 26 by 17 pixels then Places a purple dot at position (199, 233) then Places a orange circle of radius 24 at center (366, 188).
; PLAN: r0=205(x), r1=235(y), r2=26(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=233(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=188(y), r12=24(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 205
LDI r1, 235
LDI r2, 26
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 233
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 188
LDI r12, 24
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
