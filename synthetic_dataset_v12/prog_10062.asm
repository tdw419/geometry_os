; DESCRIPTION: Composite: Places a yellow circle of radius 27 at center (410, 175) then Creates a black rectangular region at (97, 33) spanning 13 by 98 pixels then Places a green line segment connecting (107, 158) to (148, 207).
; PLAN: r0=410(x), r1=175(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=33(y), r7=13(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x1), r11=158(y1), r12=148(x2), r13=207(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 175
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 33
LDI r7, 13
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 158
LDI r12, 148
LDI r13, 207
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
