; DESCRIPTION: Composite: Draws a purple circle centered at (59, 186) with radius 49 then Creates a purple rectangular region at (404, 148) spanning 48 by 62 pixels then Draws a red line from (499, 122) to (411, 243).
; PLAN: r0=59(x), r1=186(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=148(y), r7=48(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=499(x1), r11=122(y1), r12=411(x2), r13=243(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 186
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 148
LDI r7, 48
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 122
LDI r12, 411
LDI r13, 243
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
