; DESCRIPTION: Composite: Renders a white box of size 44x110 starting at (201, 102) then Draws a white circle centered at (389, 165) with radius 62 then Renders a black line between points (23, 121) and (377, 107).
; PLAN: r0=201(x), r1=102(y), r2=44(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=165(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x1), r11=121(y1), r12=377(x2), r13=107(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 102
LDI r2, 44
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 165
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 121
LDI r12, 377
LDI r13, 107
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
