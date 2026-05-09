; DESCRIPTION: Composite: Draws a cyan line from (116, 43) to (483, 116) then Creates a purple rectangular region at (390, 88) spanning 31 by 102 pixels then Places a magenta circle of radius 16 at center (73, 206).
; PLAN: r0=116(x1), r1=43(y1), r2=483(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=88(y), r7=31(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x), r11=206(y), r12=16(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 43
LDI r2, 483
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 88
LDI r7, 31
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 206
LDI r12, 16
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
