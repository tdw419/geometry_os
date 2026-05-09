; DESCRIPTION: Composite: Places a purple line segment connecting (280, 92) to (151, 194) then Places a magenta 91x98 rectangle at position (80, 151) then Draws a black circle centered at (368, 238) with radius 12.
; PLAN: r0=280(x1), r1=92(y1), r2=151(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=151(y), r7=91(width), r8=98(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x), r11=238(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 92
LDI r2, 151
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 151
LDI r7, 91
LDI r8, 98
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 238
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
