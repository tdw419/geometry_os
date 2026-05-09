; DESCRIPTION: Composite: Places a purple line segment connecting (337, 80) to (131, 12) then Places a magenta 26x33 rectangle at position (265, 46) then Renders a purple disk with center (358, 99) and radius 17.
; PLAN: r0=337(x1), r1=80(y1), r2=131(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=46(y), r7=26(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x), r11=99(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 80
LDI r2, 131
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 46
LDI r7, 26
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 99
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
