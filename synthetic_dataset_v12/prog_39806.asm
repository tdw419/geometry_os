; DESCRIPTION: Composite: Draws a orange line from (440, 4) to (172, 178) then Creates a white rectangular region at (458, 98) spanning 32 by 91 pixels then Places a magenta circle of radius 35 at center (371, 183).
; PLAN: r0=440(x1), r1=4(y1), r2=172(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=98(y), r7=32(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=183(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 4
LDI r2, 172
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 98
LDI r7, 32
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 183
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
