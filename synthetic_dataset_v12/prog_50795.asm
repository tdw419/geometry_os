; DESCRIPTION: Composite: Places a red line segment connecting (55, 143) to (91, 182) then Renders a black disk with center (171, 186) and radius 57 then Creates a orange rectangular region at (243, 206) spanning 54 by 45 pixels.
; PLAN: r0=55(x1), r1=143(y1), r2=91(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=186(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=243(x), r11=206(y), r12=54(width), r13=45(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 143
LDI r2, 91
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 186
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 243
LDI r11, 206
LDI r12, 54
LDI r13, 45
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
