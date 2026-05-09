; DESCRIPTION: Composite: Draws a purple line from (232, 16) to (143, 118) then Renders a magenta box of size 117x111 starting at (318, 25) then Places a green dot at position (82, 160).
; PLAN: r0=232(x1), r1=16(y1), r2=143(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=25(y), r7=117(width), r8=111(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x), r11=160(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 16
LDI r2, 143
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 25
LDI r7, 117
LDI r8, 111
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 160
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
