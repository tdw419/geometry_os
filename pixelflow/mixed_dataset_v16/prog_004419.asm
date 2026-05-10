; DESCRIPTION: Composite: Creates a red rectangular region at (410, 84) spanning 76 by 116 pixels then Renders a black line between points (145, 169) and (57, 53) then Places a black circle of radius 33 at center (57, 185).
; PLAN: r0=410(x), r1=84(y), r2=76(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x1), r6=169(y1), r7=57(x2), r8=53(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=185(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 84
LDI r2, 76
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 169
LDI r7, 57
LDI r8, 53
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 185
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
