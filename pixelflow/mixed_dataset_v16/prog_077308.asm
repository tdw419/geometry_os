; DESCRIPTION: Composite: Draws a white circle centered at (82, 142) with radius 75 then Creates a blue rectangular region at (184, 164) spanning 70 by 18 pixels then Places a cyan line segment connecting (171, 121) to (13, 27).
; PLAN: r0=82(x), r1=142(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=164(y), r7=70(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x1), r11=121(y1), r12=13(x2), r13=27(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 142
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 164
LDI r7, 70
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 121
LDI r12, 13
LDI r13, 27
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
