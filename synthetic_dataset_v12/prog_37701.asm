; DESCRIPTION: Composite: Draws a yellow line from (390, 156) to (489, 70) then Places a magenta dot at position (149, 23).
; PLAN: r0=390(x1), r1=156(y1), r2=489(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=23(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 156
LDI r2, 489
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 23
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
