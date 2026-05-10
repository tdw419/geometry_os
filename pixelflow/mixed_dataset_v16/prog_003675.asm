; DESCRIPTION: Composite: Places a yellow line segment connecting (425, 237) to (178, 191) then Renders a red box of size 62x79 starting at (22, 132) then Places a magenta circle of radius 33 at center (91, 132).
; PLAN: r0=425(x1), r1=237(y1), r2=178(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=132(y), r7=62(width), r8=79(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x), r11=132(y), r12=33(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 425
LDI r1, 237
LDI r2, 178
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 132
LDI r7, 62
LDI r8, 79
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 132
LDI r12, 33
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
