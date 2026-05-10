; DESCRIPTION: Composite: Creates a purple circular shape at (356, 117) with radius 54 then Renders a orange line between points (421, 7) and (55, 177) then Creates a magenta rectangular region at (391, 104) spanning 105 by 116 pixels.
; PLAN: r0=356(x), r1=117(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x1), r6=7(y1), r7=55(x2), r8=177(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=104(y), r12=105(width), r13=116(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 117
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 7
LDI r7, 55
LDI r8, 177
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 104
LDI r12, 105
LDI r13, 116
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
