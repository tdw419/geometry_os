; DESCRIPTION: Composite: Places a yellow line segment connecting (29, 137) to (258, 150) then Places a cyan dot at position (381, 21) then Draws a green circle centered at (463, 213) with radius 41.
; PLAN: r0=29(x1), r1=137(y1), r2=258(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=21(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=463(x), r11=213(y), r12=41(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 137
LDI r2, 258
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 21
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 463
LDI r11, 213
LDI r12, 41
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
