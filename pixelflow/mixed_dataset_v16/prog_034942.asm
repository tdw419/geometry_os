; DESCRIPTION: Composite: Draws a purple line from (368, 246) to (459, 133) then Renders a white box of size 100x80 starting at (45, 22) then Places a orange dot at position (10, 201).
; PLAN: r0=368(x1), r1=246(y1), r2=459(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=22(y), r7=100(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=10(x), r11=201(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 246
LDI r2, 459
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 22
LDI r7, 100
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 201
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
