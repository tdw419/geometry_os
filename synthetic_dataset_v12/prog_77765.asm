; DESCRIPTION: Composite: Renders a black disk with center (289, 172) and radius 70 then Renders a yellow line between points (179, 61) and (339, 217) then Draws a cyan rectangle at (287, 73) with width 82 and height 92.
; PLAN: r0=289(x), r1=172(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x1), r6=61(y1), r7=339(x2), r8=217(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=73(y), r12=82(width), r13=92(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 172
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 61
LDI r7, 339
LDI r8, 217
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 73
LDI r12, 82
LDI r13, 92
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
