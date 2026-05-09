; DESCRIPTION: Composite: Renders a red box of size 45x70 starting at (107, 102) then Draws a yellow circle centered at (190, 242) with radius 13 then Draws a blue line from (403, 123) to (119, 212).
; PLAN: r0=107(x), r1=102(y), r2=45(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=242(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x1), r11=123(y1), r12=119(x2), r13=212(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 102
LDI r2, 45
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 242
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 123
LDI r12, 119
LDI r13, 212
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
