; DESCRIPTION: Composite: Places a white circle of radius 69 at center (381, 182) then Creates a purple rectangular region at (343, 212) spanning 33 by 29 pixels then Places a orange dot at position (350, 85).
; PLAN: r0=381(x), r1=182(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=212(y), r7=33(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=350(x), r11=85(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 182
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 212
LDI r7, 33
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 85
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
