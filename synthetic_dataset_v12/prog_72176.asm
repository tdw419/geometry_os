; DESCRIPTION: Composite: Creates a yellow rectangular region at (16, 138) spanning 119 by 22 pixels then Draws a black line from (349, 110) to (430, 4) then Places a black dot at position (142, 186).
; PLAN: r0=16(x), r1=138(y), r2=119(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=110(y1), r7=430(x2), r8=4(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=186(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 16
LDI r1, 138
LDI r2, 119
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 110
LDI r7, 430
LDI r8, 4
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 186
LDI r12, 0x000000
PSET r10, r11, r12
HALT
