; DESCRIPTION: Composite: Creates a cyan circular shape at (252, 95) with radius 38 then Renders a purple line between points (318, 148) and (4, 109) then Places a green 32x83 rectangle at position (207, 67).
; PLAN: r0=252(x), r1=95(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x1), r6=148(y1), r7=4(x2), r8=109(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=67(y), r12=32(width), r13=83(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 95
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 148
LDI r7, 4
LDI r8, 109
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 67
LDI r12, 32
LDI r13, 83
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
