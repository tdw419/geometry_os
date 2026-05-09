; DESCRIPTION: Composite: Renders a red line between points (390, 82) and (462, 182) then Draws a blue rectangle at (359, 146) with width 38 and height 56 then Places a magenta dot at position (484, 158).
; PLAN: r0=390(x1), r1=82(y1), r2=462(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=146(y), r7=38(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x), r11=158(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 82
LDI r2, 462
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 146
LDI r7, 38
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 158
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
