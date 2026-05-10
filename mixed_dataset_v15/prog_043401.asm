; DESCRIPTION: Composite: Draws a blue line from (445, 143) to (226, 216) then Creates a green rectangular region at (127, 50) spanning 84 by 98 pixels then Places a purple dot at position (266, 227).
; PLAN: r0=445(x1), r1=143(y1), r2=226(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=50(y), r7=84(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=266(x), r11=227(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 143
LDI r2, 226
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 50
LDI r7, 84
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 227
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
