; DESCRIPTION: Composite: Places a red line segment connecting (219, 76) to (271, 66) then Sets a single green pixel at (375, 7) then Draws a orange rectangle at (145, 79) with width 111 and height 91.
; PLAN: r0=219(x1), r1=76(y1), r2=271(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=7(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=145(x), r11=79(y), r12=111(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 76
LDI r2, 271
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 7
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 145
LDI r11, 79
LDI r12, 111
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
