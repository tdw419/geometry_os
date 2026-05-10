; DESCRIPTION: Composite: Draws a green circle centered at (455, 147) with radius 43 then Draws a black line from (40, 2) to (26, 167).
; PLAN: r0=455(x), r1=147(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x1), r6=2(y1), r7=26(x2), r8=167(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 147
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 2
LDI r7, 26
LDI r8, 167
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
