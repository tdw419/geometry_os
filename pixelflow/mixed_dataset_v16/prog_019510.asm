; DESCRIPTION: Composite: Places a red dot at position (339, 11) then Creates a green circular shape at (88, 40) with radius 28 then Draws a orange line from (332, 22) to (280, 29).
; PLAN: r0=339(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=40(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x1), r11=22(y1), r12=280(x2), r13=29(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 88
LDI r6, 40
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 22
LDI r12, 280
LDI r13, 29
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
