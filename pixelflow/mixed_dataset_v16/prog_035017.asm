; DESCRIPTION: Composite: Places a green 48x112 rectangle at position (150, 104) then Places a blue line segment connecting (63, 48) to (46, 154) then Creates a purple circular shape at (207, 67) with radius 21.
; PLAN: r0=150(x), r1=104(y), r2=48(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x1), r6=48(y1), r7=46(x2), r8=154(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=67(y), r12=21(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 104
LDI r2, 48
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 48
LDI r7, 46
LDI r8, 154
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 67
LDI r12, 21
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
