; DESCRIPTION: Composite: Creates a white rectangular region at (366, 25) spanning 98 by 106 pixels then Draws a yellow line from (203, 16) to (320, 169) then Renders a blue disk with center (252, 144) and radius 37.
; PLAN: r0=366(x), r1=25(y), r2=98(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=16(y1), r7=320(x2), r8=169(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=144(y), r12=37(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 25
LDI r2, 98
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 16
LDI r7, 320
LDI r8, 169
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 144
LDI r12, 37
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
