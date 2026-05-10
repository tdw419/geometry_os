; DESCRIPTION: Composite: Creates a orange circular shape at (121, 87) with radius 80 then Places a green line segment connecting (248, 154) to (141, 239) then Draws a red rectangle at (77, 134) with width 104 and height 77.
; PLAN: r0=121(x), r1=87(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x1), r6=154(y1), r7=141(x2), r8=239(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=134(y), r12=104(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 87
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 154
LDI r7, 141
LDI r8, 239
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 134
LDI r12, 104
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
