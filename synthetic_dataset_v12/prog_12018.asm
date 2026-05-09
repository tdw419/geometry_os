; DESCRIPTION: Composite: Creates a yellow rectangular region at (301, 72) spanning 88 by 120 pixels then Places a black circle of radius 45 at center (418, 158) then Renders a red line between points (369, 220) and (15, 24).
; PLAN: r0=301(x), r1=72(y), r2=88(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=158(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x1), r11=220(y1), r12=15(x2), r13=24(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 72
LDI r2, 88
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 158
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 220
LDI r12, 15
LDI r13, 24
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
