; DESCRIPTION: Composite: Renders a blue line between points (323, 201) and (186, 175) then Draws a red rectangle at (369, 43) with width 89 and height 99 then Places a magenta dot at position (439, 64).
; PLAN: r0=323(x1), r1=201(y1), r2=186(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=43(y), r7=89(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=64(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 201
LDI r2, 186
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 43
LDI r7, 89
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 64
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
