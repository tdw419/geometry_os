; DESCRIPTION: Composite: Places a orange line segment connecting (56, 249) to (342, 200) then Creates a orange rectangular region at (103, 141) spanning 78 by 110 pixels then Sets a single cyan pixel at (245, 80).
; PLAN: r0=56(x1), r1=249(y1), r2=342(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=141(y), r7=78(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=80(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 56
LDI r1, 249
LDI r2, 342
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 141
LDI r7, 78
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 80
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
