; DESCRIPTION: Composite: Places a orange circle of radius 10 at center (150, 185) then Draws a white line from (254, 223) to (452, 26) then Creates a blue rectangular region at (309, 64) spanning 78 by 97 pixels.
; PLAN: r0=150(x), r1=185(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x1), r6=223(y1), r7=452(x2), r8=26(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=64(y), r12=78(width), r13=97(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 185
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 223
LDI r7, 452
LDI r8, 26
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 64
LDI r12, 78
LDI r13, 97
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
