; DESCRIPTION: Composite: Renders a purple disk with center (207, 109) and radius 47 then Draws a black rectangle at (269, 7) with width 108 and height 120 then Renders a magenta line between points (46, 190) and (315, 123).
; PLAN: r0=207(x), r1=109(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=7(y), r7=108(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x1), r11=190(y1), r12=315(x2), r13=123(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 109
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 7
LDI r7, 108
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 190
LDI r12, 315
LDI r13, 123
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
