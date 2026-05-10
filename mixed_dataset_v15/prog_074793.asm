; DESCRIPTION: Composite: Creates a magenta circular shape at (224, 122) with radius 76 then Creates a orange rectangular region at (241, 132) spanning 103 by 29 pixels then Draws a magenta line from (344, 153) to (283, 3).
; PLAN: r0=224(x), r1=122(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=132(y), r7=103(width), r8=29(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x1), r11=153(y1), r12=283(x2), r13=3(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 122
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 132
LDI r7, 103
LDI r8, 29
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 153
LDI r12, 283
LDI r13, 3
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
