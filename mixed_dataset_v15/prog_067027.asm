; DESCRIPTION: Composite: Draws a green line from (389, 139) to (432, 229) then Creates a red rectangular region at (327, 135) spanning 84 by 98 pixels then Places a purple dot at position (294, 186).
; PLAN: r0=389(x1), r1=139(y1), r2=432(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=135(y), r7=84(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x), r11=186(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 139
LDI r2, 432
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 135
LDI r7, 84
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 186
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
