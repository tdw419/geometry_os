; DESCRIPTION: Composite: Creates a yellow rectangular region at (43, 13) spanning 29 by 18 pixels then Places a orange line segment connecting (76, 129) to (172, 116) then Sets a single red pixel at (234, 83).
; PLAN: r0=43(x), r1=13(y), r2=29(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=129(y1), r7=172(x2), r8=116(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=83(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 13
LDI r2, 29
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 129
LDI r7, 172
LDI r8, 116
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 83
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
