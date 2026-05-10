; DESCRIPTION: Composite: Creates a white circular shape at (158, 151) with radius 66 then Places a black line segment connecting (321, 12) to (37, 212) then Creates a blue rectangular region at (122, 102) spanning 12 by 22 pixels.
; PLAN: r0=158(x), r1=151(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=12(y1), r7=37(x2), r8=212(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=102(y), r12=12(width), r13=22(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 151
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 12
LDI r7, 37
LDI r8, 212
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 102
LDI r12, 12
LDI r13, 22
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
