; DESCRIPTION: Composite: Draws a yellow line from (364, 16) to (311, 249) then Places a white dot at position (207, 181).
; PLAN: r0=364(x1), r1=16(y1), r2=311(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=181(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 16
LDI r2, 311
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 181
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
