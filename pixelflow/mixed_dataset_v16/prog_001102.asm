; DESCRIPTION: Composite: Renders a yellow box of size 38x85 starting at (364, 58) then Places a purple dot at position (250, 118) then Renders a red line between points (302, 54) and (291, 117).
; PLAN: r0=364(x), r1=58(y), r2=38(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=118(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=302(x1), r11=54(y1), r12=291(x2), r13=117(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 58
LDI r2, 38
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 118
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 302
LDI r11, 54
LDI r12, 291
LDI r13, 117
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
