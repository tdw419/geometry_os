; DESCRIPTION: Composite: Places a red 68x45 rectangle at position (172, 146) then Places a yellow circle of radius 55 at center (147, 123) then Places a red line segment connecting (166, 190) to (229, 60).
; PLAN: r0=172(x), r1=146(y), r2=68(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=123(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x1), r11=190(y1), r12=229(x2), r13=60(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 146
LDI r2, 68
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 123
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 190
LDI r12, 229
LDI r13, 60
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
