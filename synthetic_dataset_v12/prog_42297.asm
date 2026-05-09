; DESCRIPTION: Composite: Creates a blue rectangular region at (17, 101) spanning 95 by 55 pixels then Draws a magenta line from (407, 129) to (137, 248).
; PLAN: r0=17(x), r1=101(y), r2=95(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=129(y1), r7=137(x2), r8=248(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 101
LDI r2, 95
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 129
LDI r7, 137
LDI r8, 248
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
