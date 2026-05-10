; DESCRIPTION: Composite: Renders a red line between points (66, 158) and (97, 60) then Creates a red circular shape at (153, 67) with radius 67 then Renders a orange box of size 94x33 starting at (176, 183).
; PLAN: r0=66(x1), r1=158(y1), r2=97(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=67(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x), r11=183(y), r12=94(width), r13=33(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 158
LDI r2, 97
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 67
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 183
LDI r12, 94
LDI r13, 33
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
