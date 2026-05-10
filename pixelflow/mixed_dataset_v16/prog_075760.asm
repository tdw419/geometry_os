; DESCRIPTION: Composite: Creates a black rectangular region at (137, 65) spanning 39 by 31 pixels then Draws a orange line from (105, 115) to (382, 254) then Renders a blue disk with center (79, 163) and radius 17.
; PLAN: r0=137(x), r1=65(y), r2=39(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x1), r6=115(y1), r7=382(x2), r8=254(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=163(y), r12=17(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 137
LDI r1, 65
LDI r2, 39
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 115
LDI r7, 382
LDI r8, 254
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 163
LDI r12, 17
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
