; DESCRIPTION: Composite: Draws a black line from (152, 189) to (429, 137) then Draws a blue rectangle at (364, 156) with width 105 and height 54 then Draws a red circle centered at (309, 80) with radius 45.
; PLAN: r0=152(x1), r1=189(y1), r2=429(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=156(y), r7=105(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=80(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 189
LDI r2, 429
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 156
LDI r7, 105
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 80
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
