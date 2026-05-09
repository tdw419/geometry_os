; DESCRIPTION: Composite: Places a green 11x17 rectangle at position (44, 70) then Places a blue line segment connecting (279, 134) to (108, 1) then Draws a red circle centered at (247, 41) with radius 30.
; PLAN: r0=44(x), r1=70(y), r2=11(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=134(y1), r7=108(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=41(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 70
LDI r2, 11
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 134
LDI r7, 108
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 41
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
