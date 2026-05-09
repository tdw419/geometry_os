; DESCRIPTION: Composite: Draws a black rectangle at (34, 119) with width 81 and height 82 then Places a red circle of radius 19 at center (82, 147) then Draws a yellow line from (315, 1) to (123, 194).
; PLAN: r0=34(x), r1=119(y), r2=81(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=147(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x1), r11=1(y1), r12=123(x2), r13=194(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 119
LDI r2, 81
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 147
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 1
LDI r12, 123
LDI r13, 194
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
