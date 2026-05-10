; DESCRIPTION: Composite: Draws a green line from (293, 78) to (94, 228) then Creates a orange circular shape at (232, 154) with radius 41 then Creates a purple rectangular region at (220, 88) spanning 94 by 10 pixels.
; PLAN: r0=293(x1), r1=78(y1), r2=94(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=154(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x), r11=88(y), r12=94(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 78
LDI r2, 94
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 154
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 88
LDI r12, 94
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
