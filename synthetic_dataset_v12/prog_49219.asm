; DESCRIPTION: Composite: Places a green line segment connecting (484, 244) to (31, 153) then Places a orange dot at position (148, 165) then Creates a black rectangular region at (173, 211) spanning 66 by 19 pixels.
; PLAN: r0=484(x1), r1=244(y1), r2=31(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=165(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=211(y), r12=66(width), r13=19(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 244
LDI r2, 31
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 165
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 173
LDI r11, 211
LDI r12, 66
LDI r13, 19
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
