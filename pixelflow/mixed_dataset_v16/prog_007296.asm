; DESCRIPTION: Composite: Renders a orange line between points (220, 255) and (83, 197) then Creates a black rectangular region at (256, 87) spanning 82 by 105 pixels then Renders a purple disk with center (438, 81) and radius 38.
; PLAN: r0=220(x1), r1=255(y1), r2=83(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=87(y), r7=82(width), r8=105(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=81(y), r12=38(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 255
LDI r2, 83
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 87
LDI r7, 82
LDI r8, 105
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 81
LDI r12, 38
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
