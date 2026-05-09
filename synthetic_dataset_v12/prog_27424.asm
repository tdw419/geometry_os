; DESCRIPTION: Composite: Draws a yellow circle centered at (371, 201) with radius 52 then Places a red line segment connecting (25, 151) to (309, 167) then Places a black 54x54 rectangle at position (440, 189).
; PLAN: r0=371(x), r1=201(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x1), r6=151(y1), r7=309(x2), r8=167(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=440(x), r11=189(y), r12=54(width), r13=54(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 201
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 151
LDI r7, 309
LDI r8, 167
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 189
LDI r12, 54
LDI r13, 54
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
