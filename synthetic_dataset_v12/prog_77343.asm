; DESCRIPTION: Composite: Places a purple 90x88 rectangle at position (303, 153) then Draws a purple line from (85, 35) to (29, 182) then Places a yellow dot at position (296, 42).
; PLAN: r0=303(x), r1=153(y), r2=90(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=35(y1), r7=29(x2), r8=182(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=42(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 153
LDI r2, 90
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 35
LDI r7, 29
LDI r8, 182
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 42
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
