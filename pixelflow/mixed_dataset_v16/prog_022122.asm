; DESCRIPTION: Composite: Creates a yellow rectangular region at (295, 134) spanning 109 by 75 pixels then Renders a blue line between points (109, 177) and (41, 61) then Places a purple circle of radius 26 at center (198, 42).
; PLAN: r0=295(x), r1=134(y), r2=109(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=177(y1), r7=41(x2), r8=61(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=42(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 134
LDI r2, 109
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 177
LDI r7, 41
LDI r8, 61
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 42
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
