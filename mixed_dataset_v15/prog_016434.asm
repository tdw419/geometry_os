; DESCRIPTION: Composite: Creates a orange circular shape at (198, 99) with radius 70 then Creates a black rectangular region at (37, 139) spanning 12 by 10 pixels then Renders a black line between points (372, 208) and (181, 209).
; PLAN: r0=198(x), r1=99(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=139(y), r7=12(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=372(x1), r11=208(y1), r12=181(x2), r13=209(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 99
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 139
LDI r7, 12
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 208
LDI r12, 181
LDI r13, 209
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
