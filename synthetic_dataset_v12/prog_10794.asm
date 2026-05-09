; DESCRIPTION: Composite: Creates a white rectangular region at (50, 31) spanning 11 by 26 pixels then Draws a black line from (317, 99) to (450, 164) then Draws a purple circle centered at (240, 66) with radius 62.
; PLAN: r0=50(x), r1=31(y), r2=11(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x1), r6=99(y1), r7=450(x2), r8=164(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=66(y), r12=62(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 31
LDI r2, 11
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 99
LDI r7, 450
LDI r8, 164
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 66
LDI r12, 62
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
