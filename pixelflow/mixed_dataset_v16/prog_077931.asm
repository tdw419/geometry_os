; DESCRIPTION: Composite: Places a black 78x21 rectangle at position (52, 163) then Creates a orange circular shape at (91, 184) with radius 30 then Draws a orange line from (360, 141) to (144, 96).
; PLAN: r0=52(x), r1=163(y), r2=78(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=184(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x1), r11=141(y1), r12=144(x2), r13=96(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 163
LDI r2, 78
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 184
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 141
LDI r12, 144
LDI r13, 96
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
