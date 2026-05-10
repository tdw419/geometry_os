; DESCRIPTION: Composite: Draws a white circle centered at (352, 91) with radius 58 then Sets a single orange pixel at (410, 240) then Creates a red rectangular region at (245, 14) spanning 119 by 90 pixels.
; PLAN: r0=352(x), r1=91(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=240(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=14(y), r12=119(width), r13=90(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 91
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 240
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 245
LDI r11, 14
LDI r12, 119
LDI r13, 90
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
