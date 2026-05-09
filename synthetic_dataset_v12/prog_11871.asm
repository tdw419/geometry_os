; DESCRIPTION: Composite: Places a yellow 70x24 rectangle at position (344, 95) then Draws a purple line from (309, 202) to (241, 106) then Sets a single white pixel at (494, 248).
; PLAN: r0=344(x), r1=95(y), r2=70(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x1), r6=202(y1), r7=241(x2), r8=106(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=494(x), r11=248(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 95
LDI r2, 70
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 202
LDI r7, 241
LDI r8, 106
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 248
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
