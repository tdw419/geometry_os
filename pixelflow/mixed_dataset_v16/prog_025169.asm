; DESCRIPTION: Composite: Renders a orange line between points (319, 191) and (453, 18) then Renders a magenta box of size 14x94 starting at (6, 127) then Places a blue circle of radius 32 at center (415, 35).
; PLAN: r0=319(x1), r1=191(y1), r2=453(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=127(y), r7=14(width), r8=94(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=415(x), r11=35(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 191
LDI r2, 453
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 127
LDI r7, 14
LDI r8, 94
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 35
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
