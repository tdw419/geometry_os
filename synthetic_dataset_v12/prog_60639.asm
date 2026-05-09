; DESCRIPTION: Composite: Draws a purple circle centered at (198, 91) with radius 60 then Renders a magenta box of size 80x105 starting at (70, 33) then Renders a yellow line between points (20, 107) and (490, 188).
; PLAN: r0=198(x), r1=91(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=33(y), r7=80(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=20(x1), r11=107(y1), r12=490(x2), r13=188(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 91
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 33
LDI r7, 80
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 107
LDI r12, 490
LDI r13, 188
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
