; DESCRIPTION: Composite: Places a orange line segment connecting (480, 18) to (213, 213) then Sets a single black pixel at (372, 78) then Creates a blue rectangular region at (121, 59) spanning 31 by 29 pixels.
; PLAN: r0=480(x1), r1=18(y1), r2=213(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=78(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=59(y), r12=31(width), r13=29(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 18
LDI r2, 213
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 78
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 121
LDI r11, 59
LDI r12, 31
LDI r13, 29
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
