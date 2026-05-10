; DESCRIPTION: Composite: Places a red line segment connecting (358, 230) to (99, 83) then Creates a blue rectangular region at (43, 58) spanning 55 by 84 pixels then Sets a single green pixel at (281, 53).
; PLAN: r0=358(x1), r1=230(y1), r2=99(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=58(y), r7=55(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x), r11=53(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 230
LDI r2, 99
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 58
LDI r7, 55
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 53
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
