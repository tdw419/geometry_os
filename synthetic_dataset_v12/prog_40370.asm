; DESCRIPTION: Composite: Creates a purple rectangular region at (44, 197) spanning 14 by 50 pixels then Draws a purple line from (391, 81) to (473, 8) then Places a red circle of radius 12 at center (444, 22).
; PLAN: r0=44(x), r1=197(y), r2=14(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=81(y1), r7=473(x2), r8=8(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=444(x), r11=22(y), r12=12(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 197
LDI r2, 14
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 81
LDI r7, 473
LDI r8, 8
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 22
LDI r12, 12
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
