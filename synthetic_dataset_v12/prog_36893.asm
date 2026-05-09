; DESCRIPTION: Composite: Creates a purple rectangular region at (489, 42) spanning 10 by 70 pixels then Places a orange circle of radius 62 at center (207, 168) then Draws a orange line from (228, 181) to (337, 60).
; PLAN: r0=489(x), r1=42(y), r2=10(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=168(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x1), r11=181(y1), r12=337(x2), r13=60(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 42
LDI r2, 10
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 168
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 181
LDI r12, 337
LDI r13, 60
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
