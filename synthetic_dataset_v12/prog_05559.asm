; DESCRIPTION: Composite: Renders a blue box of size 104x30 starting at (205, 219) then Draws a cyan circle centered at (221, 145) with radius 79 then Places a blue line segment connecting (3, 156) to (395, 122).
; PLAN: r0=205(x), r1=219(y), r2=104(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=145(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=3(x1), r11=156(y1), r12=395(x2), r13=122(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 219
LDI r2, 104
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 145
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 3
LDI r11, 156
LDI r12, 395
LDI r13, 122
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
