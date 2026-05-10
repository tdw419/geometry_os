; DESCRIPTION: Composite: Places a black 89x34 rectangle at position (8, 157) then Creates a green circular shape at (101, 111) with radius 67 then Places a purple line segment connecting (114, 230) to (60, 234).
; PLAN: r0=8(x), r1=157(y), r2=89(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=111(y), r7=67(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=114(x1), r11=230(y1), r12=60(x2), r13=234(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 157
LDI r2, 89
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 111
LDI r7, 67
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 114
LDI r11, 230
LDI r12, 60
LDI r13, 234
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
