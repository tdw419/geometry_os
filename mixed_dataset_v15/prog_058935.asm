; DESCRIPTION: Composite: Renders a black box of size 57x101 starting at (54, 20) then Sets a single red pixel at (69, 28) then Places a purple line segment connecting (273, 29) to (102, 141).
; PLAN: r0=54(x), r1=20(y), r2=57(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=28(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=273(x1), r11=29(y1), r12=102(x2), r13=141(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 20
LDI r2, 57
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 28
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 273
LDI r11, 29
LDI r12, 102
LDI r13, 141
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
