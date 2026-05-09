; DESCRIPTION: Composite: Places a white circle of radius 10 at center (57, 135) then Creates a orange rectangular region at (341, 44) spanning 67 by 64 pixels then Places a black line segment connecting (475, 204) to (485, 8).
; PLAN: r0=57(x), r1=135(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=44(y), r7=67(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x1), r11=204(y1), r12=485(x2), r13=8(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 135
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 44
LDI r7, 67
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 204
LDI r12, 485
LDI r13, 8
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
