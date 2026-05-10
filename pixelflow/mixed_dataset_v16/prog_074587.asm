; DESCRIPTION: Composite: Sets a single purple pixel at (183, 173) then Places a white line segment connecting (46, 134) to (153, 190) then Creates a black circular shape at (122, 96) with radius 57.
; PLAN: r0=183(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=46(x1), r6=134(y1), r7=153(x2), r8=190(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=96(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 134
LDI r7, 153
LDI r8, 190
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 96
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
