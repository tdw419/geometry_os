; DESCRIPTION: Composite: Draws a red circle centered at (176, 92) with radius 65 then Renders a yellow box of size 70x66 starting at (150, 38) then Renders a blue line between points (353, 17) and (108, 77).
; PLAN: r0=176(x), r1=92(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=38(y), r7=70(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x1), r11=17(y1), r12=108(x2), r13=77(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 92
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 38
LDI r7, 70
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 17
LDI r12, 108
LDI r13, 77
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
