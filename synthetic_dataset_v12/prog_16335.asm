; DESCRIPTION: Composite: Creates a blue rectangular region at (34, 143) spanning 71 by 32 pixels then Draws a orange line from (212, 85) to (506, 30) then Places a white circle of radius 29 at center (409, 224).
; PLAN: r0=34(x), r1=143(y), r2=71(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=85(y1), r7=506(x2), r8=30(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=224(y), r12=29(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 34
LDI r1, 143
LDI r2, 71
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 85
LDI r7, 506
LDI r8, 30
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 224
LDI r12, 29
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
