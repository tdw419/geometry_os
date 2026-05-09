; DESCRIPTION: Composite: Places a red dot at position (92, 118) then Creates a white rectangular region at (70, 88) spanning 17 by 54 pixels then Places a white circle of radius 58 at center (369, 97).
; PLAN: r0=92(x), r1=118(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=88(y), r7=17(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=369(x), r11=97(y), r12=58(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 118
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 70
LDI r6, 88
LDI r7, 17
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 97
LDI r12, 58
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
