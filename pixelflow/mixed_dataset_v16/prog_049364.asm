; DESCRIPTION: Composite: Places a yellow circle of radius 64 at center (128, 186) then Draws a yellow line from (343, 224) to (473, 201) then Places a orange 30x39 rectangle at position (58, 137).
; PLAN: r0=128(x), r1=186(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=224(y1), r7=473(x2), r8=201(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=58(x), r11=137(y), r12=30(width), r13=39(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 186
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 224
LDI r7, 473
LDI r8, 201
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 137
LDI r12, 30
LDI r13, 39
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
