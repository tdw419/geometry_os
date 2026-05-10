; DESCRIPTION: Composite: Creates a white rectangular region at (186, 51) spanning 67 by 31 pixels then Places a black circle of radius 66 at center (102, 78) then Renders a red line between points (504, 14) and (467, 118).
; PLAN: r0=186(x), r1=51(y), r2=67(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=78(y), r7=66(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x1), r11=14(y1), r12=467(x2), r13=118(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 51
LDI r2, 67
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 78
LDI r7, 66
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 14
LDI r12, 467
LDI r13, 118
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
