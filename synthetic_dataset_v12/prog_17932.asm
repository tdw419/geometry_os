; DESCRIPTION: Composite: Creates a white rectangular region at (9, 212) spanning 93 by 28 pixels then Draws a red circle centered at (27, 191) with radius 19 then Places a white line segment connecting (26, 183) to (275, 104).
; PLAN: r0=9(x), r1=212(y), r2=93(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x), r6=191(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x1), r11=183(y1), r12=275(x2), r13=104(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 212
LDI r2, 93
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 191
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 183
LDI r12, 275
LDI r13, 104
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
