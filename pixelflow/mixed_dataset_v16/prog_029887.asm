; DESCRIPTION: Composite: Draws a purple rectangle at (74, 89) with width 111 and height 79 then Draws a red line from (396, 40) to (401, 190) then Places a magenta dot at position (273, 246).
; PLAN: r0=74(x), r1=89(y), r2=111(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x1), r6=40(y1), r7=401(x2), r8=190(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=246(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 89
LDI r2, 111
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 40
LDI r7, 401
LDI r8, 190
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 246
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
