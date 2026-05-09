; DESCRIPTION: Composite: Places a purple circle of radius 75 at center (417, 173) then Renders a orange box of size 91x60 starting at (101, 47) then Renders a green line between points (469, 148) and (400, 170).
; PLAN: r0=417(x), r1=173(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=47(y), r7=91(width), r8=60(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x1), r11=148(y1), r12=400(x2), r13=170(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 173
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 47
LDI r7, 91
LDI r8, 60
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 148
LDI r12, 400
LDI r13, 170
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
