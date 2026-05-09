; DESCRIPTION: Composite: Draws a black circle centered at (423, 102) with radius 79 then Draws a purple line from (326, 149) to (50, 38) then Places a red dot at position (127, 156).
; PLAN: r0=423(x), r1=102(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x1), r6=149(y1), r7=50(x2), r8=38(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=156(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 102
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 149
LDI r7, 50
LDI r8, 38
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 156
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
