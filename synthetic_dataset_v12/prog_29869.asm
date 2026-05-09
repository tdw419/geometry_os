; DESCRIPTION: Composite: Draws a yellow circle centered at (335, 190) with radius 62 then Renders a orange line between points (49, 233) and (436, 149) then Draws a green rectangle at (108, 44) with width 91 and height 118.
; PLAN: r0=335(x), r1=190(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x1), r6=233(y1), r7=436(x2), r8=149(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=44(y), r12=91(width), r13=118(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 190
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 233
LDI r7, 436
LDI r8, 149
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 44
LDI r12, 91
LDI r13, 118
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
