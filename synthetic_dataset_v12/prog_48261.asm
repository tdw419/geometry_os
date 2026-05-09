; DESCRIPTION: Composite: Creates a blue circular shape at (331, 70) with radius 59 then Draws a yellow line from (106, 235) to (153, 56) then Draws a blue rectangle at (146, 97) with width 110 and height 117.
; PLAN: r0=331(x), r1=70(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x1), r6=235(y1), r7=153(x2), r8=56(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=97(y), r12=110(width), r13=117(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 70
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 235
LDI r7, 153
LDI r8, 56
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 97
LDI r12, 110
LDI r13, 117
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
