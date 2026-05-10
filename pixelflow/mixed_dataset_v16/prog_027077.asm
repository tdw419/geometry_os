; DESCRIPTION: Composite: Draws a blue rectangle at (344, 57) with width 14 and height 15 then Sets a single purple pixel at (300, 246) then Renders a red line between points (266, 92) and (101, 147).
; PLAN: r0=344(x), r1=57(y), r2=14(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=246(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=266(x1), r11=92(y1), r12=101(x2), r13=147(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 57
LDI r2, 14
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 246
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 266
LDI r11, 92
LDI r12, 101
LDI r13, 147
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
