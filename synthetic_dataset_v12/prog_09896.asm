; DESCRIPTION: Composite: Places a green line segment connecting (362, 173) to (258, 132) then Places a yellow dot at position (43, 145) then Draws a yellow circle centered at (271, 182) with radius 41.
; PLAN: r0=362(x1), r1=173(y1), r2=258(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=145(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=271(x), r11=182(y), r12=41(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 173
LDI r2, 258
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 145
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 271
LDI r11, 182
LDI r12, 41
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
