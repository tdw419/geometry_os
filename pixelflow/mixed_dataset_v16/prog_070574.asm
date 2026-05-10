; DESCRIPTION: Composite: Places a green 67x75 rectangle at position (58, 88) then Draws a red line from (5, 169) to (375, 139) then Places a magenta circle of radius 69 at center (274, 86).
; PLAN: r0=58(x), r1=88(y), r2=67(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x1), r6=169(y1), r7=375(x2), r8=139(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=86(y), r12=69(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 88
LDI r2, 67
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 169
LDI r7, 375
LDI r8, 139
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 86
LDI r12, 69
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
