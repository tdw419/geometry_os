; DESCRIPTION: Composite: Places a purple line segment connecting (368, 83) to (321, 182) then Creates a black rectangular region at (333, 105) spanning 75 by 114 pixels then Renders a green disk with center (295, 79) and radius 10.
; PLAN: r0=368(x1), r1=83(y1), r2=321(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=105(y), r7=75(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x), r11=79(y), r12=10(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 83
LDI r2, 321
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 105
LDI r7, 75
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 79
LDI r12, 10
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
