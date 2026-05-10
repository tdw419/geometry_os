; DESCRIPTION: Composite: Places a red circle of radius 61 at center (123, 158) then Creates a red rectangular region at (198, 37) spanning 25 by 99 pixels then Places a purple line segment connecting (174, 111) to (425, 155).
; PLAN: r0=123(x), r1=158(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=37(y), r7=25(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x1), r11=111(y1), r12=425(x2), r13=155(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 158
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 37
LDI r7, 25
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 111
LDI r12, 425
LDI r13, 155
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
