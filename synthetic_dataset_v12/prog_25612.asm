; DESCRIPTION: Composite: Places a black circle of radius 65 at center (93, 144) then Creates a black rectangular region at (239, 51) spanning 77 by 99 pixels then Draws a orange line from (40, 213) to (24, 181).
; PLAN: r0=93(x), r1=144(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=51(y), r7=77(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x1), r11=213(y1), r12=24(x2), r13=181(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 144
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 51
LDI r7, 77
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 213
LDI r12, 24
LDI r13, 181
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
