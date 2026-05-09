; DESCRIPTION: Composite: Places a purple 104x116 rectangle at position (118, 13) then Creates a cyan circular shape at (300, 207) with radius 24 then Places a magenta line segment connecting (308, 248) to (389, 62).
; PLAN: r0=118(x), r1=13(y), r2=104(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=207(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x1), r11=248(y1), r12=389(x2), r13=62(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 13
LDI r2, 104
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 207
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 248
LDI r12, 389
LDI r13, 62
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
