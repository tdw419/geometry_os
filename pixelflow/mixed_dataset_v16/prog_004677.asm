; DESCRIPTION: Composite: Creates a yellow circular shape at (355, 130) with radius 24 then Places a yellow line segment connecting (16, 241) to (389, 30) then Places a white 71x72 rectangle at position (35, 155).
; PLAN: r0=355(x), r1=130(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x1), r6=241(y1), r7=389(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=155(y), r12=71(width), r13=72(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 130
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 241
LDI r7, 389
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 155
LDI r12, 71
LDI r13, 72
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
