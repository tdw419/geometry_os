; DESCRIPTION: Composite: Places a cyan dot at position (147, 63) then Renders a orange line between points (296, 23) and (166, 45).
; PLAN: r0=147(x), r1=63(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x1), r6=23(y1), r7=166(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 63
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 23
LDI r7, 166
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
