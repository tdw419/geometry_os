; DESCRIPTION: Composite: Places a magenta 72x23 rectangle at position (80, 149) then Draws a red line from (266, 185) to (57, 62) then Places a purple circle of radius 64 at center (77, 102).
; PLAN: r0=80(x), r1=149(y), r2=72(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=185(y1), r7=57(x2), r8=62(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=102(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 80
LDI r1, 149
LDI r2, 72
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 185
LDI r7, 57
LDI r8, 62
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 102
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
