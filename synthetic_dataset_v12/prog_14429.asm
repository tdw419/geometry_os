; DESCRIPTION: Composite: Places a green 59x73 rectangle at position (48, 45) then Creates a purple circular shape at (318, 73) with radius 32 then Places a orange line segment connecting (115, 211) to (70, 183).
; PLAN: r0=48(x), r1=45(y), r2=59(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=73(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x1), r11=211(y1), r12=70(x2), r13=183(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 45
LDI r2, 59
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 73
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 211
LDI r12, 70
LDI r13, 183
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
