; DESCRIPTION: Composite: Renders a orange box of size 19x12 starting at (363, 122) then Places a yellow line segment connecting (496, 44) to (385, 210) then Places a purple circle of radius 61 at center (386, 181).
; PLAN: r0=363(x), r1=122(y), r2=19(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x1), r6=44(y1), r7=385(x2), r8=210(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=181(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 122
LDI r2, 19
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 44
LDI r7, 385
LDI r8, 210
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 181
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
