; DESCRIPTION: Composite: Creates a black rectangular region at (277, 170) spanning 39 by 43 pixels then Creates a white circular shape at (448, 172) with radius 29 then Draws a yellow line from (511, 144) to (321, 241).
; PLAN: r0=277(x), r1=170(y), r2=39(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=172(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=511(x1), r11=144(y1), r12=321(x2), r13=241(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 170
LDI r2, 39
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 172
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 511
LDI r11, 144
LDI r12, 321
LDI r13, 241
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
