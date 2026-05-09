; DESCRIPTION: Composite: Places a orange line segment connecting (219, 240) to (124, 218) then Creates a white rectangular region at (211, 91) spanning 53 by 37 pixels then Places a yellow dot at position (265, 188).
; PLAN: r0=219(x1), r1=240(y1), r2=124(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=91(y), r7=53(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=188(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 240
LDI r2, 124
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 91
LDI r7, 53
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 188
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
