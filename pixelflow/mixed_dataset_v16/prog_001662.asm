; DESCRIPTION: Composite: Creates a orange circular shape at (347, 173) with radius 79 then Renders a black line between points (331, 91) and (118, 190) then Draws a magenta rectangle at (111, 64) with width 78 and height 86.
; PLAN: r0=347(x), r1=173(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=91(y1), r7=118(x2), r8=190(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=64(y), r12=78(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 173
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 91
LDI r7, 118
LDI r8, 190
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 64
LDI r12, 78
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
