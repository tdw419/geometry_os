; DESCRIPTION: Composite: Renders a magenta line between points (197, 115) and (91, 143) then Places a purple 102x99 rectangle at position (304, 133) then Creates a magenta circular shape at (300, 170) with radius 58.
; PLAN: r0=197(x1), r1=115(y1), r2=91(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=133(y), r7=102(width), r8=99(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=170(y), r12=58(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 115
LDI r2, 91
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 133
LDI r7, 102
LDI r8, 99
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 170
LDI r12, 58
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
