; DESCRIPTION: Composite: Draws a blue circle centered at (327, 102) with radius 53 then Places a white line segment connecting (86, 64) to (297, 45) then Creates a black rectangular region at (227, 3) spanning 10 by 50 pixels.
; PLAN: r0=327(x), r1=102(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x1), r6=64(y1), r7=297(x2), r8=45(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=3(y), r12=10(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 102
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 64
LDI r7, 297
LDI r8, 45
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 3
LDI r12, 10
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
