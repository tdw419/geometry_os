; DESCRIPTION: Composite: Places a purple 49x66 rectangle at position (311, 1) then Places a black line segment connecting (79, 84) to (182, 42) then Renders a blue disk with center (321, 85) and radius 35.
; PLAN: r0=311(x), r1=1(y), r2=49(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=84(y1), r7=182(x2), r8=42(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=85(y), r12=35(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 311
LDI r1, 1
LDI r2, 49
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 84
LDI r7, 182
LDI r8, 42
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 85
LDI r12, 35
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
