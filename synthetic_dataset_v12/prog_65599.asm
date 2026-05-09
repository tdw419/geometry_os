; DESCRIPTION: Composite: Renders a black line between points (311, 169) and (206, 107) then Draws a red rectangle at (469, 157) with width 15 and height 59 then Sets a single yellow pixel at (153, 127).
; PLAN: r0=311(x1), r1=169(y1), r2=206(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=157(y), r7=15(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=127(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 169
LDI r2, 206
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 157
LDI r7, 15
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 127
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
