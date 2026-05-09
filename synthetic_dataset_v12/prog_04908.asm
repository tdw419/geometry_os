; DESCRIPTION: Composite: Sets a single cyan pixel at (32, 118) then Draws a white rectangle at (3, 169) with width 114 and height 57 then Renders a yellow line between points (75, 141) and (347, 121).
; PLAN: r0=32(x), r1=118(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=169(y), r7=114(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x1), r11=141(y1), r12=347(x2), r13=121(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 118
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 169
LDI r7, 114
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 141
LDI r12, 347
LDI r13, 121
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
