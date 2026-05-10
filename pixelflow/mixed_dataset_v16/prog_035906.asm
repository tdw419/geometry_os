; DESCRIPTION: Composite: Places a green 50x84 rectangle at position (293, 29) then Places a yellow line segment connecting (368, 211) to (389, 216) then Creates a cyan circular shape at (192, 148) with radius 60.
; PLAN: r0=293(x), r1=29(y), r2=50(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=211(y1), r7=389(x2), r8=216(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=148(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 29
LDI r2, 50
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 211
LDI r7, 389
LDI r8, 216
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 148
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
