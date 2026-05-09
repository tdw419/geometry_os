; DESCRIPTION: Composite: Places a purple 35x94 rectangle at position (149, 116) then Renders a yellow line between points (90, 168) and (265, 208) then Draws a purple circle centered at (146, 90) with radius 10.
; PLAN: r0=149(x), r1=116(y), r2=35(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x1), r6=168(y1), r7=265(x2), r8=208(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=90(y), r12=10(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 116
LDI r2, 35
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 168
LDI r7, 265
LDI r8, 208
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 90
LDI r12, 10
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
