; DESCRIPTION: Composite: Draws a yellow rectangle at (137, 22) with width 75 and height 70 then Places a purple line segment connecting (236, 34) to (391, 59).
; PLAN: r0=137(x), r1=22(y), r2=75(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=34(y1), r7=391(x2), r8=59(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 22
LDI r2, 75
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 34
LDI r7, 391
LDI r8, 59
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
