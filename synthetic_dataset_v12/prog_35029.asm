; DESCRIPTION: Composite: Places a orange line segment connecting (312, 205) to (127, 109) then Creates a purple circular shape at (399, 66) with radius 45 then Places a blue 61x35 rectangle at position (56, 94).
; PLAN: r0=312(x1), r1=205(y1), r2=127(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=66(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=56(x), r11=94(y), r12=61(width), r13=35(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 205
LDI r2, 127
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 66
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 56
LDI r11, 94
LDI r12, 61
LDI r13, 35
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
