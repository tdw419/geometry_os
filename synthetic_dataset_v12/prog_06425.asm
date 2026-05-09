; DESCRIPTION: Composite: Places a yellow line segment connecting (263, 170) to (476, 93) then Draws a orange circle centered at (59, 114) with radius 30 then Renders a blue box of size 73x48 starting at (325, 23).
; PLAN: r0=263(x1), r1=170(y1), r2=476(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=114(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x), r11=23(y), r12=73(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 170
LDI r2, 476
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 114
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 23
LDI r12, 73
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
