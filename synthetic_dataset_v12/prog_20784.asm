; DESCRIPTION: Composite: Creates a black rectangular region at (20, 70) spanning 109 by 13 pixels then Places a yellow circle of radius 76 at center (184, 114) then Draws a magenta line from (462, 39) to (122, 43).
; PLAN: r0=20(x), r1=70(y), r2=109(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=114(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x1), r11=39(y1), r12=122(x2), r13=43(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 70
LDI r2, 109
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 114
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 39
LDI r12, 122
LDI r13, 43
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
