; DESCRIPTION: Composite: Draws a green circle centered at (352, 169) with radius 44 then Draws a green line from (465, 92) to (270, 86) then Places a orange dot at position (26, 89).
; PLAN: r0=352(x), r1=169(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x1), r6=92(y1), r7=270(x2), r8=86(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=89(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 169
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 92
LDI r7, 270
LDI r8, 86
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 89
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
