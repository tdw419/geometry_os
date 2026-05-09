; DESCRIPTION: Composite: Places a purple line segment connecting (132, 100) to (97, 194) then Draws a green rectangle at (18, 145) with width 116 and height 100 then Creates a green circular shape at (230, 152) with radius 61.
; PLAN: r0=132(x1), r1=100(y1), r2=97(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=145(y), r7=116(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=230(x), r11=152(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 100
LDI r2, 97
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 145
LDI r7, 116
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 152
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
