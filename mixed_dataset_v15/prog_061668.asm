; DESCRIPTION: Composite: Places a purple 63x33 rectangle at position (68, 58) then Draws a purple circle centered at (330, 161) with radius 78 then Renders a orange line between points (418, 182) and (27, 104).
; PLAN: r0=68(x), r1=58(y), r2=63(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=161(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x1), r11=182(y1), r12=27(x2), r13=104(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 58
LDI r2, 63
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 161
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 182
LDI r12, 27
LDI r13, 104
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
