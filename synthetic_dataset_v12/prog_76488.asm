; DESCRIPTION: Composite: Places a cyan line segment connecting (107, 191) to (62, 206) then Creates a orange circular shape at (55, 63) with radius 19 then Creates a purple rectangular region at (129, 0) spanning 103 by 111 pixels.
; PLAN: r0=107(x1), r1=191(y1), r2=62(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=63(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x), r11=0(y), r12=103(width), r13=111(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 191
LDI r2, 62
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 63
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 0
LDI r12, 103
LDI r13, 111
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
