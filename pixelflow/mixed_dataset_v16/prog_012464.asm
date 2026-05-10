; DESCRIPTION: Composite: Draws a red rectangle at (249, 78) with width 71 and height 47 then Renders a white line between points (186, 79) and (147, 68) then Draws a red circle centered at (93, 210) with radius 20.
; PLAN: r0=249(x), r1=78(y), r2=71(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x1), r6=79(y1), r7=147(x2), r8=68(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=210(y), r12=20(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 78
LDI r2, 71
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 79
LDI r7, 147
LDI r8, 68
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 210
LDI r12, 20
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
