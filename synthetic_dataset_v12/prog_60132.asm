; DESCRIPTION: Composite: Renders a yellow line between points (475, 184) and (139, 99) then Creates a black rectangular region at (303, 9) spanning 86 by 95 pixels then Sets a single green pixel at (109, 255).
; PLAN: r0=475(x1), r1=184(y1), r2=139(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=9(y), r7=86(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=109(x), r11=255(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 475
LDI r1, 184
LDI r2, 139
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 9
LDI r7, 86
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 255
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
