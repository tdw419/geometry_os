; DESCRIPTION: Composite: Places a purple 111x98 rectangle at position (194, 21) then Creates a green circular shape at (342, 68) with radius 48 then Places a orange line segment connecting (49, 15) to (448, 104).
; PLAN: r0=194(x), r1=21(y), r2=111(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=68(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x1), r11=15(y1), r12=448(x2), r13=104(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 21
LDI r2, 111
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 68
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 15
LDI r12, 448
LDI r13, 104
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
