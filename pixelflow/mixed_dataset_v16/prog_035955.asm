; DESCRIPTION: Composite: Places a cyan 19x17 rectangle at position (336, 4) then Creates a purple circular shape at (216, 173) with radius 69 then Draws a purple line from (372, 11) to (11, 181).
; PLAN: r0=336(x), r1=4(y), r2=19(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=173(y), r7=69(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=372(x1), r11=11(y1), r12=11(x2), r13=181(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 4
LDI r2, 19
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 173
LDI r7, 69
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 372
LDI r11, 11
LDI r12, 11
LDI r13, 181
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
