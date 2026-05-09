; DESCRIPTION: Composite: Draws a yellow circle centered at (213, 133) with radius 43 then Draws a orange line from (408, 29) to (324, 79).
; PLAN: r0=213(x), r1=133(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x1), r6=29(y1), r7=324(x2), r8=79(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 133
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 29
LDI r7, 324
LDI r8, 79
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
