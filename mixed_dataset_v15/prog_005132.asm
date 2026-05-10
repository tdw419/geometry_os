; DESCRIPTION: Composite: Places a white line segment connecting (24, 95) to (221, 68) then Creates a green circular shape at (162, 109) with radius 56 then Places a green 34x95 rectangle at position (140, 123).
; PLAN: r0=24(x1), r1=95(y1), r2=221(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=109(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=123(y), r12=34(width), r13=95(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 95
LDI r2, 221
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 109
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 123
LDI r12, 34
LDI r13, 95
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
