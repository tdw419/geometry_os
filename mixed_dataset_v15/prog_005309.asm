; DESCRIPTION: Composite: Sets a single orange pixel at (358, 210) then Renders a yellow line between points (132, 72) and (14, 83) then Creates a yellow rectangular region at (334, 41) spanning 21 by 91 pixels.
; PLAN: r0=358(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=132(x1), r6=72(y1), r7=14(x2), r8=83(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=41(y), r12=21(width), r13=91(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 210
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 132
LDI r6, 72
LDI r7, 14
LDI r8, 83
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 41
LDI r12, 21
LDI r13, 91
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
