; DESCRIPTION: Composite: Renders a yellow line between points (129, 57) and (225, 165) then Creates a white rectangular region at (280, 160) spanning 106 by 11 pixels then Places a cyan circle of radius 61 at center (180, 98).
; PLAN: r0=129(x1), r1=57(y1), r2=225(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=160(y), r7=106(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x), r11=98(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 57
LDI r2, 225
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 160
LDI r7, 106
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 98
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
