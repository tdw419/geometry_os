; DESCRIPTION: Composite: Draws a blue line from (300, 150) to (453, 100) then Draws a green rectangle at (97, 80) with width 18 and height 20 then Places a black circle of radius 12 at center (97, 234).
; PLAN: r0=300(x1), r1=150(y1), r2=453(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=80(y), r7=18(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=234(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 150
LDI r2, 453
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 80
LDI r7, 18
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 234
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
