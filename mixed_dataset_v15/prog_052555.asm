; DESCRIPTION: Composite: Draws a purple circle centered at (490, 135) with radius 20 then Renders a black line between points (359, 251) and (69, 120) then Renders a purple box of size 18x15 starting at (482, 181).
; PLAN: r0=490(x), r1=135(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x1), r6=251(y1), r7=69(x2), r8=120(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=482(x), r11=181(y), r12=18(width), r13=15(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 135
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 251
LDI r7, 69
LDI r8, 120
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 181
LDI r12, 18
LDI r13, 15
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
