; DESCRIPTION: Composite: Sets a single red pixel at (272, 84) then Creates a black rectangular region at (316, 59) spanning 67 by 56 pixels then Places a red circle of radius 19 at center (39, 22).
; PLAN: r0=272(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=59(y), r7=67(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x), r11=22(y), r12=19(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 84
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 316
LDI r6, 59
LDI r7, 67
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 22
LDI r12, 19
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
