; DESCRIPTION: Composite: Places a white 118x86 rectangle at position (307, 156) then Creates a blue circular shape at (400, 157) with radius 69 then Places a orange line segment connecting (273, 190) to (202, 181).
; PLAN: r0=307(x), r1=156(y), r2=118(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=157(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=273(x1), r11=190(y1), r12=202(x2), r13=181(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 156
LDI r2, 118
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 157
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 273
LDI r11, 190
LDI r12, 202
LDI r13, 181
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
