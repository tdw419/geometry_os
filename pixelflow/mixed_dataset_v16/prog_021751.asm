; DESCRIPTION: Composite: Renders a white disk with center (353, 181) and radius 19 then Creates a cyan rectangular region at (402, 83) spanning 67 by 23 pixels then Places a orange line segment connecting (7, 211) to (477, 42).
; PLAN: r0=353(x), r1=181(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=83(y), r7=67(width), r8=23(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=7(x1), r11=211(y1), r12=477(x2), r13=42(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 181
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 83
LDI r7, 67
LDI r8, 23
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 211
LDI r12, 477
LDI r13, 42
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
