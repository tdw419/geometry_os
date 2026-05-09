; DESCRIPTION: Composite: Creates a white circular shape at (187, 118) with radius 18 then Places a black line segment connecting (130, 99) to (478, 247) then Creates a cyan rectangular region at (339, 30) spanning 12 by 49 pixels.
; PLAN: r0=187(x), r1=118(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=99(y1), r7=478(x2), r8=247(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=30(y), r12=12(width), r13=49(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 118
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 99
LDI r7, 478
LDI r8, 247
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 30
LDI r12, 12
LDI r13, 49
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
