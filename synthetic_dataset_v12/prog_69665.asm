; DESCRIPTION: Composite: Draws a purple line from (160, 192) to (401, 128) then Creates a orange circular shape at (395, 106) with radius 71 then Renders a black box of size 19x107 starting at (476, 104).
; PLAN: r0=160(x1), r1=192(y1), r2=401(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=106(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=476(x), r11=104(y), r12=19(width), r13=107(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 192
LDI r2, 401
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 106
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 476
LDI r11, 104
LDI r12, 19
LDI r13, 107
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
