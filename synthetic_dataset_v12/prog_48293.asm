; DESCRIPTION: Composite: Draws a orange line from (482, 240) to (336, 65) then Sets a single green pixel at (78, 160) then Creates a green circular shape at (481, 210) with radius 16.
; PLAN: r0=482(x1), r1=240(y1), r2=336(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=160(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=481(x), r11=210(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 240
LDI r2, 336
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 160
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 481
LDI r11, 210
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
