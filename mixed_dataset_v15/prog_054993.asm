; DESCRIPTION: Composite: Draws a yellow rectangle at (178, 187) with width 73 and height 51 then Renders a red line between points (337, 45) and (44, 182) then Places a purple dot at position (51, 44).
; PLAN: r0=178(x), r1=187(y), r2=73(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x1), r6=45(y1), r7=44(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=44(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 187
LDI r2, 73
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 45
LDI r7, 44
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 44
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
