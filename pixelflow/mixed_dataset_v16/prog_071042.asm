; DESCRIPTION: Composite: Places a black dot at position (246, 252) then Draws a orange line from (146, 19) to (385, 168) then Places a black circle of radius 15 at center (334, 160).
; PLAN: r0=246(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=146(x1), r6=19(y1), r7=385(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=160(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 146
LDI r6, 19
LDI r7, 385
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 160
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
