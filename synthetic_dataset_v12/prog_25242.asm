; DESCRIPTION: Composite: Places a orange line segment connecting (390, 50) to (170, 209) then Creates a cyan rectangular region at (193, 6) spanning 47 by 92 pixels then Places a orange circle of radius 55 at center (347, 68).
; PLAN: r0=390(x1), r1=50(y1), r2=170(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=6(y), r7=47(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x), r11=68(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 50
LDI r2, 170
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 6
LDI r7, 47
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 68
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
