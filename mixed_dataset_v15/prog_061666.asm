; DESCRIPTION: Composite: Renders a orange box of size 88x57 starting at (16, 13) then Draws a red line from (315, 20) to (339, 178) then Renders a purple disk with center (267, 227) and radius 14.
; PLAN: r0=16(x), r1=13(y), r2=88(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=20(y1), r7=339(x2), r8=178(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=227(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 16
LDI r1, 13
LDI r2, 88
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 20
LDI r7, 339
LDI r8, 178
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 227
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
