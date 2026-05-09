; DESCRIPTION: Composite: Renders a cyan line between points (322, 169) and (9, 97) then Creates a yellow rectangular region at (385, 55) spanning 99 by 88 pixels then Sets a single black pixel at (136, 96).
; PLAN: r0=322(x1), r1=169(y1), r2=9(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=55(y), r7=99(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=96(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 322
LDI r1, 169
LDI r2, 9
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 55
LDI r7, 99
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 96
LDI r12, 0x000000
PSET r10, r11, r12
HALT
