; DESCRIPTION: Composite: Draws a magenta circle centered at (331, 126) with radius 50 then Draws a black rectangle at (18, 141) with width 57 and height 46 then Renders a black line between points (38, 41) and (442, 39).
; PLAN: r0=331(x), r1=126(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=141(y), r7=57(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=38(x1), r11=41(y1), r12=442(x2), r13=39(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 126
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 141
LDI r7, 57
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 41
LDI r12, 442
LDI r13, 39
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
