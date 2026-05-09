; DESCRIPTION: Composite: Sets a single purple pixel at (86, 12) then Creates a orange rectangular region at (88, 10) spanning 104 by 100 pixels then Creates a black circular shape at (199, 160) with radius 72.
; PLAN: r0=86(x), r1=12(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=10(y), r7=104(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x), r11=160(y), r12=72(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 12
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 10
LDI r7, 104
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 160
LDI r12, 72
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
