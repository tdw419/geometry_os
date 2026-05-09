; DESCRIPTION: Composite: Draws a cyan line from (46, 187) to (358, 124) then Places a orange dot at position (241, 49) then Draws a orange circle centered at (388, 58) with radius 21.
; PLAN: r0=46(x1), r1=187(y1), r2=358(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=49(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=388(x), r11=58(y), r12=21(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 46
LDI r1, 187
LDI r2, 358
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 49
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 388
LDI r11, 58
LDI r12, 21
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
