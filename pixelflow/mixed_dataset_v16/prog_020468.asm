; DESCRIPTION: Composite: Creates a green rectangular region at (61, 17) spanning 98 by 61 pixels then Renders a orange line between points (470, 107) and (124, 136) then Places a red dot at position (188, 41).
; PLAN: r0=61(x), r1=17(y), r2=98(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x1), r6=107(y1), r7=124(x2), r8=136(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=41(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 17
LDI r2, 98
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 107
LDI r7, 124
LDI r8, 136
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 41
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
