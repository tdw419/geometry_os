; DESCRIPTION: Composite: Draws a orange circle centered at (300, 164) with radius 46 then Places a black line segment connecting (422, 161) to (47, 255) then Creates a red rectangular region at (372, 58) spanning 18 by 94 pixels.
; PLAN: r0=300(x), r1=164(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x1), r6=161(y1), r7=47(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=58(y), r12=18(width), r13=94(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 164
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 161
LDI r7, 47
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 58
LDI r12, 18
LDI r13, 94
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
