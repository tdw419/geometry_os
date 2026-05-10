; DESCRIPTION: Composite: Places a green 67x68 rectangle at position (241, 13) then Draws a black circle centered at (49, 24) with radius 13 then Renders a magenta line between points (484, 163) and (498, 120).
; PLAN: r0=241(x), r1=13(y), r2=67(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=24(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=484(x1), r11=163(y1), r12=498(x2), r13=120(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 13
LDI r2, 67
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 24
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 484
LDI r11, 163
LDI r12, 498
LDI r13, 120
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
