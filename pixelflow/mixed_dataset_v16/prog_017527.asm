; DESCRIPTION: Composite: Places a yellow 32x56 rectangle at position (147, 45) then Draws a orange line from (98, 163) to (155, 43).
; PLAN: r0=147(x), r1=45(y), r2=32(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=163(y1), r7=155(x2), r8=43(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 45
LDI r2, 32
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 163
LDI r7, 155
LDI r8, 43
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
