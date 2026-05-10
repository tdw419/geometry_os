; DESCRIPTION: Composite: Places a blue 62x44 rectangle at position (138, 10) then Places a orange line segment connecting (438, 122) to (373, 87) then Places a black circle of radius 67 at center (253, 107).
; PLAN: r0=138(x), r1=10(y), r2=62(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=122(y1), r7=373(x2), r8=87(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=107(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 10
LDI r2, 62
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 122
LDI r7, 373
LDI r8, 87
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 107
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
