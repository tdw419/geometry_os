; DESCRIPTION: Composite: Draws a yellow circle centered at (321, 109) with radius 28 then Renders a green box of size 109x115 starting at (134, 122) then Draws a purple line from (475, 245) to (38, 205).
; PLAN: r0=321(x), r1=109(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=122(y), r7=109(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x1), r11=245(y1), r12=38(x2), r13=205(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 109
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 122
LDI r7, 109
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 245
LDI r12, 38
LDI r13, 205
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
