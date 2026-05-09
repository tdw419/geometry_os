; DESCRIPTION: Composite: Creates a magenta rectangular region at (400, 121) spanning 77 by 104 pixels then Creates a magenta circular shape at (104, 58) with radius 57 then Draws a blue line from (505, 31) to (33, 33).
; PLAN: r0=400(x), r1=121(y), r2=77(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=58(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=31(y1), r12=33(x2), r13=33(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 121
LDI r2, 77
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 58
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 31
LDI r12, 33
LDI r13, 33
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
