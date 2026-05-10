; DESCRIPTION: Composite: Places a red line segment connecting (465, 8) to (47, 165) then Renders a magenta box of size 106x79 starting at (390, 71) then Places a purple dot at position (261, 141).
; PLAN: r0=465(x1), r1=8(y1), r2=47(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=71(y), r7=106(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=141(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 8
LDI r2, 47
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 71
LDI r7, 106
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 141
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
