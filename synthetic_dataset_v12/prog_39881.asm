; DESCRIPTION: Composite: Renders a black box of size 43x81 starting at (395, 13) then Creates a purple circular shape at (460, 171) with radius 38 then Draws a magenta line from (184, 158) to (395, 241).
; PLAN: r0=395(x), r1=13(y), r2=43(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=171(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=184(x1), r11=158(y1), r12=395(x2), r13=241(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 13
LDI r2, 43
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 171
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 184
LDI r11, 158
LDI r12, 395
LDI r13, 241
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
