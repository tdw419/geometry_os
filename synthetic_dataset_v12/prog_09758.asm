; DESCRIPTION: Composite: Creates a red circular shape at (224, 82) with radius 15 then Places a yellow 37x18 rectangle at position (308, 148) then Places a purple line segment connecting (391, 101) to (198, 222).
; PLAN: r0=224(x), r1=82(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=148(y), r7=37(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x1), r11=101(y1), r12=198(x2), r13=222(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 82
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 148
LDI r7, 37
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 101
LDI r12, 198
LDI r13, 222
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
