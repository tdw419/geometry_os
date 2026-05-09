; DESCRIPTION: Composite: Draws a blue line from (254, 245) to (252, 58) then Places a yellow dot at position (508, 166).
; PLAN: r0=254(x1), r1=245(y1), r2=252(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=508(x), r6=166(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 245
LDI r2, 252
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 166
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
