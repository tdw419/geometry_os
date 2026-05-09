; DESCRIPTION: Composite: Places a orange 90x19 rectangle at position (9, 42) then Creates a black circular shape at (90, 84) with radius 28 then Draws a magenta line from (463, 76) to (122, 201).
; PLAN: r0=9(x), r1=42(y), r2=90(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=84(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x1), r11=76(y1), r12=122(x2), r13=201(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 42
LDI r2, 90
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 84
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 76
LDI r12, 122
LDI r13, 201
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
