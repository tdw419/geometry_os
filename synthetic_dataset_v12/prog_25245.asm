; DESCRIPTION: Composite: Places a white dot at position (155, 2) then Renders a red line between points (490, 216) and (401, 12) then Draws a purple circle centered at (395, 123) with radius 68.
; PLAN: r0=155(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=490(x1), r6=216(y1), r7=401(x2), r8=12(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=123(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 490
LDI r6, 216
LDI r7, 401
LDI r8, 12
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 123
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
