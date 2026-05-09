; DESCRIPTION: Composite: Renders a cyan line between points (353, 119) and (13, 18) then Creates a cyan rectangular region at (118, 20) spanning 11 by 75 pixels then Draws a red circle centered at (380, 219) with radius 36.
; PLAN: r0=353(x1), r1=119(y1), r2=13(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=20(y), r7=11(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=380(x), r11=219(y), r12=36(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 119
LDI r2, 13
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 20
LDI r7, 11
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 219
LDI r12, 36
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
