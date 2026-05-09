; DESCRIPTION: Composite: Places a white dot at position (55, 107) then Creates a magenta rectangular region at (296, 127) spanning 78 by 41 pixels then Renders a black line between points (379, 44) and (248, 180).
; PLAN: r0=55(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=127(y), r7=78(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x1), r11=44(y1), r12=248(x2), r13=180(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 127
LDI r7, 78
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 44
LDI r12, 248
LDI r13, 180
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
