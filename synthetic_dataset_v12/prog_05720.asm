; DESCRIPTION: Composite: Places a magenta line segment connecting (62, 249) to (131, 184) then Places a purple 93x86 rectangle at position (200, 146) then Renders a black disk with center (316, 80) and radius 80.
; PLAN: r0=62(x1), r1=249(y1), r2=131(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=146(y), r7=93(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x), r11=80(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 249
LDI r2, 131
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 146
LDI r7, 93
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 80
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
