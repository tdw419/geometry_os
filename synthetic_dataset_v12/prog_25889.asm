; DESCRIPTION: Composite: Draws a blue line from (395, 203) to (333, 8) then Draws a white circle centered at (90, 170) with radius 17 then Places a green 51x22 rectangle at position (142, 159).
; PLAN: r0=395(x1), r1=203(y1), r2=333(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=170(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x), r11=159(y), r12=51(width), r13=22(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 203
LDI r2, 333
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 170
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 159
LDI r12, 51
LDI r13, 22
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
