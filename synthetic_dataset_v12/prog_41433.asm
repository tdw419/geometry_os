; DESCRIPTION: Composite: Places a orange 65x63 rectangle at position (141, 103) then Draws a white circle centered at (434, 157) with radius 37 then Places a cyan line segment connecting (105, 69) to (266, 94).
; PLAN: r0=141(x), r1=103(y), r2=65(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=157(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x1), r11=69(y1), r12=266(x2), r13=94(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 103
LDI r2, 65
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 157
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 69
LDI r12, 266
LDI r13, 94
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
