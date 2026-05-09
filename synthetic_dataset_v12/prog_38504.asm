; DESCRIPTION: Composite: Sets a single red pixel at (66, 240) then Renders a black line between points (102, 116) and (188, 94) then Creates a white rectangular region at (28, 9) spanning 11 by 97 pixels.
; PLAN: r0=66(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=102(x1), r6=116(y1), r7=188(x2), r8=94(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=28(x), r11=9(y), r12=11(width), r13=97(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 102
LDI r6, 116
LDI r7, 188
LDI r8, 94
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 9
LDI r12, 11
LDI r13, 97
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
