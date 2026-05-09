; DESCRIPTION: Composite: Sets a single purple pixel at (489, 36) then Creates a purple circular shape at (380, 91) with radius 43 then Creates a red rectangular region at (157, 80) spanning 69 by 91 pixels.
; PLAN: r0=489(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=91(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x), r11=80(y), r12=69(width), r13=91(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 380
LDI r6, 91
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 80
LDI r12, 69
LDI r13, 91
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
