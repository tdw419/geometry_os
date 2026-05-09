; DESCRIPTION: Composite: Creates a black circular shape at (249, 147) with radius 37 then Creates a yellow rectangular region at (97, 105) spanning 78 by 74 pixels then Draws a cyan line from (504, 101) to (262, 189).
; PLAN: r0=249(x), r1=147(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=105(y), r7=78(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=504(x1), r11=101(y1), r12=262(x2), r13=189(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 147
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 105
LDI r7, 78
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 101
LDI r12, 262
LDI r13, 189
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
