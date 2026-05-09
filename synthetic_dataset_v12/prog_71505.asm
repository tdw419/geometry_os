; DESCRIPTION: Composite: Places a green dot at position (460, 27) then Creates a purple rectangular region at (297, 1) spanning 104 by 15 pixels then Creates a green circular shape at (219, 182) with radius 55.
; PLAN: r0=460(x), r1=27(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=1(y), r7=104(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=182(y), r12=55(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 27
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 1
LDI r7, 104
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 182
LDI r12, 55
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
