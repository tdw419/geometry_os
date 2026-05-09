; DESCRIPTION: Composite: Creates a blue rectangular region at (216, 89) spanning 73 by 50 pixels then Draws a orange line from (348, 102) to (416, 173) then Draws a orange circle centered at (109, 109) with radius 42.
; PLAN: r0=216(x), r1=89(y), r2=73(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=102(y1), r7=416(x2), r8=173(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=109(x), r11=109(y), r12=42(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 89
LDI r2, 73
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 102
LDI r7, 416
LDI r8, 173
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 109
LDI r12, 42
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
