; DESCRIPTION: Composite: Renders a orange disk with center (432, 185) and radius 21 then Places a white line segment connecting (305, 244) to (476, 76) then Places a red 97x71 rectangle at position (402, 151).
; PLAN: r0=432(x), r1=185(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=244(y1), r7=476(x2), r8=76(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=151(y), r12=97(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 185
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 244
LDI r7, 476
LDI r8, 76
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 151
LDI r12, 97
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
