; DESCRIPTION: Composite: Sets a single cyan pixel at (477, 171) then Creates a black rectangular region at (360, 29) spanning 105 by 81 pixels then Places a cyan line segment connecting (34, 110) to (207, 107).
; PLAN: r0=477(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=29(y), r7=105(width), r8=81(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x1), r11=110(y1), r12=207(x2), r13=107(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 29
LDI r7, 105
LDI r8, 81
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 110
LDI r12, 207
LDI r13, 107
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
