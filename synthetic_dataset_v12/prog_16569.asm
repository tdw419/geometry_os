; DESCRIPTION: Composite: Draws a orange circle centered at (98, 198) with radius 16 then Draws a yellow line from (466, 201) to (213, 21) then Renders a white box of size 97x88 starting at (141, 162).
; PLAN: r0=98(x), r1=198(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x1), r6=201(y1), r7=213(x2), r8=21(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=162(y), r12=97(width), r13=88(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 198
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 201
LDI r7, 213
LDI r8, 21
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 162
LDI r12, 97
LDI r13, 88
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
