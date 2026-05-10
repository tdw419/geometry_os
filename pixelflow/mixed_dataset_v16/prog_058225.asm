; DESCRIPTION: Composite: Draws a red circle centered at (264, 175) with radius 24 then Draws a blue line from (264, 244) to (189, 249) then Places a magenta 22x79 rectangle at position (376, 54).
; PLAN: r0=264(x), r1=175(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x1), r6=244(y1), r7=189(x2), r8=249(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=376(x), r11=54(y), r12=22(width), r13=79(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 175
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 244
LDI r7, 189
LDI r8, 249
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 54
LDI r12, 22
LDI r13, 79
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
