; DESCRIPTION: Composite: Renders a purple disk with center (363, 150) and radius 45 then Creates a red rectangular region at (25, 125) spanning 10 by 86 pixels then Places a orange line segment connecting (221, 31) to (302, 31).
; PLAN: r0=363(x), r1=150(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=125(y), r7=10(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x1), r11=31(y1), r12=302(x2), r13=31(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 150
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 125
LDI r7, 10
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 31
LDI r12, 302
LDI r13, 31
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
