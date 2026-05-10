; DESCRIPTION: Composite: Places a yellow line segment connecting (286, 116) to (351, 79) then Creates a red circular shape at (288, 99) with radius 66 then Creates a black rectangular region at (312, 84) spanning 98 by 10 pixels.
; PLAN: r0=286(x1), r1=116(y1), r2=351(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=99(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x), r11=84(y), r12=98(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 116
LDI r2, 351
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 99
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 84
LDI r12, 98
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
