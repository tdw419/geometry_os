; DESCRIPTION: Composite: Creates a orange circular shape at (308, 168) with radius 80 then Draws a blue line from (373, 141) to (344, 205) then Renders a black box of size 17x35 starting at (29, 109).
; PLAN: r0=308(x), r1=168(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=141(y1), r7=344(x2), r8=205(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=109(y), r12=17(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 168
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 141
LDI r7, 344
LDI r8, 205
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 109
LDI r12, 17
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
