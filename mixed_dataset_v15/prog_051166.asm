; DESCRIPTION: Composite: Draws a yellow line from (158, 211) to (469, 232) then Places a orange dot at position (207, 232).
; PLAN: r0=158(x1), r1=211(y1), r2=469(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=232(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 211
LDI r2, 469
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 232
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
