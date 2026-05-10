; DESCRIPTION: Composite: Sets a single cyan pixel at (290, 43) then Places a yellow line segment connecting (3, 94) to (282, 112) then Places a orange 118x109 rectangle at position (188, 33).
; PLAN: r0=290(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=94(y1), r7=282(x2), r8=112(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=33(y), r12=118(width), r13=109(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 94
LDI r7, 282
LDI r8, 112
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 33
LDI r12, 118
LDI r13, 109
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
