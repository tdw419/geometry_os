; DESCRIPTION: Composite: Draws a purple rectangle at (220, 51) with width 87 and height 82 then Renders a red line between points (471, 169) and (141, 26) then Sets a single magenta pixel at (171, 65).
; PLAN: r0=220(x), r1=51(y), r2=87(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=169(y1), r7=141(x2), r8=26(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=65(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 51
LDI r2, 87
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 169
LDI r7, 141
LDI r8, 26
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 65
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
