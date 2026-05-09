; DESCRIPTION: Composite: Places a green line segment connecting (5, 172) to (26, 105) then Places a yellow circle of radius 23 at center (126, 23) then Renders a blue box of size 24x44 starting at (173, 31).
; PLAN: r0=5(x1), r1=172(y1), r2=26(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=23(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=31(y), r12=24(width), r13=44(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 172
LDI r2, 26
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 23
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 31
LDI r12, 24
LDI r13, 44
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
