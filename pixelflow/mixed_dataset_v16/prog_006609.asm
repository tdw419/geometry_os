; DESCRIPTION: Composite: Places a purple 67x85 rectangle at position (200, 38) then Places a purple line segment connecting (483, 33) to (257, 55) then Draws a cyan circle centered at (370, 129) with radius 72.
; PLAN: r0=200(x), r1=38(y), r2=67(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=33(y1), r7=257(x2), r8=55(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=129(y), r12=72(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 38
LDI r2, 67
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 33
LDI r7, 257
LDI r8, 55
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 129
LDI r12, 72
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
