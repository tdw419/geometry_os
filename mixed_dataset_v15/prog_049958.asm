; DESCRIPTION: Composite: Draws a green circle centered at (237, 137) with radius 26 then Draws a black line from (220, 44) to (287, 9).
; PLAN: r0=237(x), r1=137(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x1), r6=44(y1), r7=287(x2), r8=9(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 137
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 44
LDI r7, 287
LDI r8, 9
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
