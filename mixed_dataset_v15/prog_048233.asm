; DESCRIPTION: Composite: Creates a magenta circular shape at (271, 130) with radius 76 then Places a purple line segment connecting (414, 87) to (230, 96) then Places a purple 45x51 rectangle at position (402, 34).
; PLAN: r0=271(x), r1=130(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=87(y1), r7=230(x2), r8=96(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=34(y), r12=45(width), r13=51(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 130
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 87
LDI r7, 230
LDI r8, 96
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 34
LDI r12, 45
LDI r13, 51
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
