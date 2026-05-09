; DESCRIPTION: Composite: Renders a purple line between points (303, 118) and (482, 195) then Places a red 117x10 rectangle at position (337, 27) then Renders a yellow disk with center (181, 132) and radius 55.
; PLAN: r0=303(x1), r1=118(y1), r2=482(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=27(y), r7=117(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x), r11=132(y), r12=55(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 118
LDI r2, 482
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 27
LDI r7, 117
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 132
LDI r12, 55
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
