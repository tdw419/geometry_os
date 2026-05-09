; DESCRIPTION: Composite: Creates a orange rectangular region at (145, 132) spanning 60 by 86 pixels then Draws a red line from (122, 54) to (430, 145) then Places a cyan circle of radius 40 at center (261, 129).
; PLAN: r0=145(x), r1=132(y), r2=60(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=54(y1), r7=430(x2), r8=145(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=129(y), r12=40(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 145
LDI r1, 132
LDI r2, 60
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 54
LDI r7, 430
LDI r8, 145
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 129
LDI r12, 40
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
