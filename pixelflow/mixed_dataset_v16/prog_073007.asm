; DESCRIPTION: Composite: Places a red 80x100 rectangle at position (429, 20) then Draws a purple line from (381, 3) to (65, 27) then Places a black circle of radius 69 at center (398, 74).
; PLAN: r0=429(x), r1=20(y), r2=80(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x1), r6=3(y1), r7=65(x2), r8=27(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=398(x), r11=74(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 20
LDI r2, 80
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 3
LDI r7, 65
LDI r8, 27
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 74
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
