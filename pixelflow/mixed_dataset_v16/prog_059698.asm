; DESCRIPTION: Composite: Draws a yellow line from (493, 168) to (123, 193) then Draws a black rectangle at (469, 15) with width 14 and height 74 then Places a red circle of radius 72 at center (297, 78).
; PLAN: r0=493(x1), r1=168(y1), r2=123(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=15(y), r7=14(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=78(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 168
LDI r2, 123
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 15
LDI r7, 14
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 78
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
