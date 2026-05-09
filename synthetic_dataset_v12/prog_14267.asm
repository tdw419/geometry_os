; DESCRIPTION: Composite: Draws a green rectangle at (82, 126) with width 54 and height 114 then Draws a purple circle centered at (456, 14) with radius 11 then Draws a orange line from (252, 196) to (18, 164).
; PLAN: r0=82(x), r1=126(y), r2=54(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=14(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x1), r11=196(y1), r12=18(x2), r13=164(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 126
LDI r2, 54
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 14
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 196
LDI r12, 18
LDI r13, 164
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
