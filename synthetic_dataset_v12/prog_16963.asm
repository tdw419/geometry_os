; DESCRIPTION: Composite: Draws a magenta line from (115, 187) to (78, 80) then Creates a purple rectangular region at (316, 58) spanning 93 by 47 pixels then Renders a cyan disk with center (205, 204) and radius 43.
; PLAN: r0=115(x1), r1=187(y1), r2=78(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=58(y), r7=93(width), r8=47(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=204(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 115
LDI r1, 187
LDI r2, 78
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 58
LDI r7, 93
LDI r8, 47
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 204
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
