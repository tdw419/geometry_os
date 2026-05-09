; DESCRIPTION: Composite: Draws a orange rectangle at (173, 25) with width 120 and height 51 then Places a blue line segment connecting (18, 234) to (347, 47) then Draws a green circle centered at (455, 138) with radius 28.
; PLAN: r0=173(x), r1=25(y), r2=120(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x1), r6=234(y1), r7=347(x2), r8=47(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=455(x), r11=138(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 25
LDI r2, 120
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 234
LDI r7, 347
LDI r8, 47
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 138
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
