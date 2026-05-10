; DESCRIPTION: Composite: Places a black line segment connecting (86, 46) to (104, 175) then Creates a black rectangular region at (142, 20) spanning 98 by 115 pixels then Places a orange dot at position (148, 112).
; PLAN: r0=86(x1), r1=46(y1), r2=104(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=20(y), r7=98(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x), r11=112(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 46
LDI r2, 104
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 20
LDI r7, 98
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 112
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
