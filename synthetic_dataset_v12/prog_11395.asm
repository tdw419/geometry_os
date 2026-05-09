; DESCRIPTION: Composite: Draws a cyan line from (255, 255) to (166, 40) then Creates a orange rectangular region at (74, 161) spanning 114 by 82 pixels then Sets a single white pixel at (319, 158).
; PLAN: r0=255(x1), r1=255(y1), r2=166(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=161(y), r7=114(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=158(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 255
LDI r2, 166
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 161
LDI r7, 114
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 158
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
