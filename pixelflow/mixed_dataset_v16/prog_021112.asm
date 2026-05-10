; DESCRIPTION: Composite: Renders a yellow box of size 40x53 starting at (11, 164) then Draws a green circle centered at (199, 21) with radius 21 then Places a white line segment connecting (135, 174) to (232, 83).
; PLAN: r0=11(x), r1=164(y), r2=40(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=21(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=135(x1), r11=174(y1), r12=232(x2), r13=83(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 164
LDI r2, 40
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 21
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 135
LDI r11, 174
LDI r12, 232
LDI r13, 83
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
