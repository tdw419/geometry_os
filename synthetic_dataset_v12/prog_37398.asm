; DESCRIPTION: Composite: Creates a cyan rectangular region at (370, 84) spanning 71 by 119 pixels then Places a blue line segment connecting (212, 117) to (30, 150) then Creates a orange circular shape at (303, 95) with radius 60.
; PLAN: r0=370(x), r1=84(y), r2=71(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=117(y1), r7=30(x2), r8=150(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=95(y), r12=60(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 84
LDI r2, 71
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 117
LDI r7, 30
LDI r8, 150
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 95
LDI r12, 60
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
