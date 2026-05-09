; DESCRIPTION: Composite: Creates a green circular shape at (59, 139) with radius 44 then Creates a magenta rectangular region at (419, 211) spanning 11 by 34 pixels then Renders a yellow line between points (416, 100) and (179, 156).
; PLAN: r0=59(x), r1=139(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=211(y), r7=11(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=416(x1), r11=100(y1), r12=179(x2), r13=156(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 139
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 211
LDI r7, 11
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 100
LDI r12, 179
LDI r13, 156
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
